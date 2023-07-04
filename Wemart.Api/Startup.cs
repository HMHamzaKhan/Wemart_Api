using System;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Wemart.Repositories;
using Wemart.SQL;
using Wemart.SQL.DAL;


namespace Wemart.Api
{
    public class Startup
    {   
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
            Connection.MsSQLConnectionString = Configuration.GetConnectionString("MsSQLHosted");
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            #region Dependencies

            services.AddScoped<ICategoryRepository, Categories>();
            services.AddScoped<IOrderRepository, Orders>();
            services.AddScoped<IProductRepository, Products>();
            services.AddScoped<IProductReviewRepository, ProductReviews>();
            services.AddScoped<IRegRepository, Registration>(); //Reg Controller
            services.AddScoped<IRiderRepository, Riders>();
            services.AddScoped<IShopRepository, Shops>();  //Shop Controller
            services.AddScoped<IUserRepository, Users>();

            #endregion


            services.AddSwaggerGen(swagger =>
            {
                swagger.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo
                {
                    Version = "V1",
                    Title = "Wemart Api Documentation",
                    Description = "this documentation will provide the information about the api endpoints",
                    Contact = new Microsoft.OpenApi.Models.OpenApiContact
                    {
                        Name = "Wemartz Team",
                        Email = "wemartdevelopers@gmail.com",
                        Url = new Uri("https://www.wemarz.somee.com/swagger")
                       // Url = new Uri("https://www.linkedin.com/in/h-m-hamza-khan-aa3678119/")
                    }
                });
            });

            services.AddAuthorization(policies =>
            {
                policies.AddPolicy("Admin", role => { role.RequireRole("Admins"); });
                policies.AddPolicy("Vendor", role => { role.RequireRole("Shops"); });
                policies.AddPolicy("Rider", role => { role.RequireRole("Riders"); });
                policies.AddPolicy("User", role => { role.RequireRole("Users");   });
            });

            services.AddAuthentication(auth =>
            {
                auth.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                auth.DefaultChallengeScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                auth.DefaultAuthenticateScheme = CookieAuthenticationDefaults.AuthenticationScheme;
            })
            .AddCookie(cookie =>
            {
                cookie.Cookie = new Microsoft.AspNetCore.Http.CookieBuilder
                {
                    Name = "WemartzApi",
                };
            });

            services.AddMvc(options =>
            {
                options.Filters.Add(new ProducesAttribute("application/json"));
            })
            .SetCompatibilityVersion(CompatibilityVersion.Version_2_1);


        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseHsts();
            }

            app.UseStaticFiles();
            app.UseHttpsRedirection();
            app.UseSwagger();
            app.UseSwaggerUI( swaggerui => { swaggerui.SwaggerEndpoint("/swagger/v1/swagger.json", "V1 Wemart Api"); } );
            app.UseAuthentication();
            app.UseMvc();

        }
    }
}
