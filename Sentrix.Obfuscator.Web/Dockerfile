FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["Sentrix.Obfuscator.Web/Sentrix.Obfuscator.Web.csproj", "Sentrix.Obfuscator.Web/"]
RUN dotnet restore "Sentrix.Obfuscator.Web/Sentrix.Obfuscator.Web.csproj"
COPY . .
WORKDIR "/src/Sentrix.Obfuscator.Web"
RUN dotnet build "./Sentrix.Obfuscator.Web.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./Sentrix.Obfuscator.Web.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Sentrix.Obfuscator.Web.dll"]
