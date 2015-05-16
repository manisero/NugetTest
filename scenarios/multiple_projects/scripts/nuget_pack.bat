set nuspecPath=..\src\MultipleProjects\MultipleProjects.nuspec

nuget pack %nuspecPath% -Prop version=1.0.0 -Prop Configuration=Release
