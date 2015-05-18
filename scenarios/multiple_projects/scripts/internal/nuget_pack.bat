set nuspecPath=%1

nuget pack %nuspecPath% -Prop Configuration=Release
