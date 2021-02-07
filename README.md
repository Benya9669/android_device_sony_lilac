Device configuration for Sony Xperia XZ1 Compact (lilac)
========================================================

Description
-----------

This repository is for RR OS 2020 on Sony Xperia XZ1 Compact (lilac).

How to build RR
----------------------

* Make a workspace:

        mkdir -p ~/rr
        cd ~/rr

* Initialize the repo:

        repo init -u https://github.com/ResurrectionRemix/platform_manifest.git -b Q

* Create a local manifest:

        cd .repo & mkdir local_manifests
        cd local_manifests & nano roomservice.xml

        <?xml version="1.0" encoding="UTF-8"?>
        <manifest>
            <!-- SONY -->
            <project name="whatawurst/android_kernel_sony_msm8998" path="kernel/sony/msm8998" remote="github" revision="lineage-17.1" />
            <project name="whatawurst/android_device_sony_yoshino-common" path="device/sony/yoshino-common" remote="github" revision="lineage-17.1" />
            <project name="Benya9669/android_device_sony_lilac" path="device/sony/lilac" remote="github" revision="rr-q" />

            <!-- Pinned blobs for lilac -->
            <project name="shank03/android_vendor_sony_lilac" path="vendor/sony/lilac" remote="github" revision="ten" />
        </manifest>

* Sync the repo:

        repo sync -f --force-sync --no-clone-bundle

* Extract vendor blobs

        cd device/sony/lilac
        ./extract-files.sh

* Setup the environment

        source build/envsetup.sh
        lunch rr_lilac-userdebug

* Build LineageOS

        make -j8 bacon
