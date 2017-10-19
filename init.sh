echo hello
{{ include (cat (var `filename`) `.txt` | nospace )| trunc 10 }}
