using ApartmentBrokerage.Api.Services;

namespace ApartmentBrokerage.Api
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Controllers
            builder.Services.AddControllers();

            // Swagger (הגרסה הרגילה והנוחה)
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            // SqlExecService
            builder.Services.AddScoped<SqlExecService>();

            var app = builder.Build();

            // Swagger UI
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();

            app.MapControllers();

            app.Run();
        }
    }
}