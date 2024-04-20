# babybuddy

Image Specific Environment Variables:

| BABYBUDDY__RELEASE | The github release to `curl`                                                |
|--------------------|-----------------------------------------------------------------------------|
| BABYBUDDY__PORT    | Passed to the `Dockerfile`'s `EXPOSE` directive and the `uwsgi` config file |

Environment variables that are tied to the upstream project can be found [here](http://docs.baby-buddy.net/configuration/intro/)
