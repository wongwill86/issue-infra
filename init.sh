echo hello
{{ include (cat (var `filename`) `.txt` | nospace ) | jsonDecode }}
