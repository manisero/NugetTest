set csprojPath=..\src\SingleProject\SingleProject\SingleProject.csproj

nuget pack %csprojPath% -Prop Configuration=Release
