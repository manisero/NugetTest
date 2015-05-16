set csprojPath=..\src\MultipleProjectsWithMain\Main\Main.csproj

nuget pack %csprojPath% -Prop Configuration=Release
