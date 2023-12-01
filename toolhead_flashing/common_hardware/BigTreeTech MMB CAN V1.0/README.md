# DFU Mode
1.  Add a jumper as shown in the image below so the board can be powered via a USB connection
    ![image](https://github.com/Esoterical/voron_canbus/assets/124253477/c5f00b2a-c6dc-4f80-b9aa-4b963d21a580)


2. Connect your device to your Pi via USB
3. Press and hold the `Reset` and `BOOT` buttons down (button locations shown in step 1)
    1. Release `Reset` button
    2. Release `BOOT` button
4. The device should now be in DFU mode. Verify this via the `lsusb` command, which should look something like this:
    ```
    Bus 001 Device 005: ID 0483:df11 STMicroelectronics STM Device in DFU Mode
    ```

# Katapult Config

![image](https://github.com/Esoterical/voron_canbus/assets/124253477/649a5bb8-f35f-42fc-b643-02341e1f4d05)


# Klipper when using Katapult

![image](https://github.com/Esoterical/voron_canbus/assets/124253477/ef7f82f2-b5b9-469d-b1aa-9bad94a4c949)


# Klipper when **NOT** using Katapult

![image](https://github.com/Esoterical/voron_canbus/assets/124253477/473c6d0f-dde6-4df6-be50-b0645d02cafd)


# Sample Configuration

A sample configuration file can be found at https://github.com/bigtreetech/MMB/tree/master/Firmware