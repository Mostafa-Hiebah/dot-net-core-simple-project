#Use Base Image from https://hub.docker.com/_/microsoft-dotnet
# First Stage base Image
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
#FROM mcr.microsoft.com/dotnet/framework/sdk:4.7.2  AS build
WORKDIR /sourcefiles
##


#Copy .csproj and Restore Dependencies
COPY *.csproj .
RUN dotnet restore

# Copy and Publish Application Files
COPY . .
RUN dotnet publish -c release -o /sourcefiles/publishFiles
WORKDIR /sourcefiles/publishFiles
#VOLUME  /sourcefiles/publishFiles


# Final Stage Image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
#FROM mcr.microsoft.com/dotnet/framework/aspnet:4.7.2
WORKDIR /app
COPY --from=build /sourcefiles/publishFiles .

ENTRYPOINT [ "dotnet", "hrapp.dll" ]