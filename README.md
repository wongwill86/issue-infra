This works:

```
~/src/test-infra$ docker run --rm -v /home/wwong/src/test-infra:/home/ubuntu/ -v /var/run/docker.sock:/var/run/docker.sock infrakit/devbundle:latest   infrakit template --var filename=file:///home/ubuntu/imported /home/ubuntu/groups.json

[
    {
        "Plugin": "group",
        "Properties": {
            "ID": "test",
            "Description": "1234567890",
            "Properties": {
                "Allocation": {
                  "Size": 1
                },
                "Instance": {
                  "Plugin": "instance-vagrant",
                  "Properties": {
                    "Box": "bento/ubuntu-16.04"
                  }
                },
                "Flavor": {
                    "Plugin": "vanilla",
                    "Properties": {
                        "InitScriptTemplateURL": "file:///home/ubuntu/init.sh"
                    }
                }
            }
        }
    }
]
```

This doesn't work:

```
~/src/test-infra$ docker run --rm -v /home/wwong/src/test-infra:/home/ubuntu/ -v /var/run/docker.sock:/var/run/docker.sock infrakit/devbundle:latest   infrakit util init --group-id test --start vanilla --var filename=file:///home/ubuntu/imported /home/ubuntu/groups.json
template: file:///home/ubuntu/init.sh:2:3: executing "file:///home/ubuntu/init.sh" at <include (cat (var `f...>: error calling include: open /home/ubuntu/{{var`filename`}}.txt: no such file or directory
CRIT[10-19|05:58:50] error executing                          module=main cmd=infrakit err="template: file:///home/ubuntu/init.sh:2:3: executing \"file:///home/ubuntu/init.sh\" at <include (cat (var `f...>: error calling include: open /home/ubuntu/{{var`filename`}}.txt: no such file or directory" fn=main.main
```
