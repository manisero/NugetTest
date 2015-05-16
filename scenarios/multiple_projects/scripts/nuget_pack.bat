set nuspecPath=..\src\MultipleProjects\MultipleProjects.nuspec

nuget pack %nuspecPath% -Prop Configuration=Release
