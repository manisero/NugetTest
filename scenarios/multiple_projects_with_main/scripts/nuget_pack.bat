set csprojPath=..\src\MultipleProjectsWithMain\Main\Main.csproj

nuget pack %csprojPath% -IncludeReferencedProjects -Prop Configuration=Release
