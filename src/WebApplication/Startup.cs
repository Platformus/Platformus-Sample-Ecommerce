// Copyright © 2015 Dmitry Sikorsky. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

using ExtCore.Data.EntityFramework;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Platformus.WebApplication.Extensions;

namespace WebApplication
{
  public class Startup
  {
    private IConfiguration configuration;
    private string extensionsPath;

    public Startup(IConfiguration configuration, IWebHostEnvironment webHostEnvironment)
    {
      this.configuration = configuration;

      if (!string.IsNullOrEmpty(this.configuration["Extensions:Path"]))
        this.extensionsPath = webHostEnvironment.ContentRootPath + this.configuration["Extensions:Path"];
    }

    public void ConfigureServices(IServiceCollection services)
    {
      services.Configure<StorageContextOptions>(options =>
        {
          options.ConnectionString = this.configuration.GetConnectionString("Default");
        }
      );

      services.AddPlatformus(this.extensionsPath);
    }

    public void Configure(IApplicationBuilder applicationBuilder, IWebHostEnvironment webHostEnvironment)
    {
      // AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);

      if (webHostEnvironment.IsDevelopment())
        applicationBuilder.UseDeveloperExceptionPage();

      applicationBuilder.UsePlatformus();
    }
  }
}