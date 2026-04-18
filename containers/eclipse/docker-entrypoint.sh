#!/bin/sh
set -e

# Install Eclipse IDE and Pleiades plugin if not exists
if [ -z "$(find /opt/eclipse -mindepth 1 ! -name ".gitkeep" -print -quit)" ]; then
    gunzip -c /tmp/eclipse.tar.gz | tar -xf - -C /opt/

    unzip /tmp/pleiades.zip -d /tmp/pleiades
    cp -r /tmp/pleiades/features/* /opt/eclipse/features/
    cp -r /tmp/pleiades/plugins/* /opt/eclipse/plugins/
    rm -rf /tmp/pleiades

    echo "-Xverify:none" >> /opt/eclipse/eclipse.ini
    echo "-javaagent:/opt/eclipse/plugins/jp.sourceforge.mergedoc.pleiades/pleiades.jar" >> /opt/eclipse/eclipse.ini
fi

exec "$@"
