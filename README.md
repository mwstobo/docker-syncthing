# docker-syncthing
Dockerfile for Syncthing

## Building
There are three build arguments: `buildhost`, `version`, and `tar_filename`. Use these to to customize where the syncthing source is downloaded from. Note you should only need to touch the `version` argument.

## Usage
* Run the basic application
```shell
$ docker run -d -p 8384:8384 -p 22000:22000 -p 21027:21027/udp syncthing
```

* Run the application with persistent config and data
```shell
$ CONFIG_DIR=/path/to/config/dir
$ DATA_DIR=/path/to/data/dir
$ docker run -d \
             -v $CONFIG_DIR:/opt/syncthing/config \
             -v $DATA_DIR:/opt/syncthing/data \
             -p 8384:8384 -p 22000:22000 -p 21027:21027/udp \
             syncthing
```
Edit `$CONFIG_DIR/config.xml` to change settings. Note you can change the `<gui><address>...</address></gui>` line to allow access to the GUI for easier config management.

If you add folders in the `$DATA_DIR` directory, they will be persistent.
