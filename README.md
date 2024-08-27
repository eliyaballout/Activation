# Activation

## MAS - Download / How to use it?

### Method 1 - PowerShell (Recommended)

-   Right-click on the Windows start menu and select PowerShell or Terminal (Not CMD).
-   Copy and paste the code below and press enter  
```
irm https://get.activated.win | iex
```
or (deprecated, will be retired on Aug 31 2024, use above instead)  
```
irm https://massgrave.dev/get | iex
```
-   You will see the activation options. Follow the on-screen instructions.
-   That's all.

---



## KMS - Download / How to use it?
### Method: Setting Up Auto-Renewal for KMS Activation

Ensure Initial KMS Activation:
    First, activate your Windows installation using the KMS method. This will activate Windows for 180 days.

Set Up Automatic Renewal via Task Scheduler:
    You can create a scheduled task that will automatically renew the activation before it expires. This way, your system will periodically contact the KMS server and renew the activation without you needing to do anything.

Steps to Create a Scheduled Task for Automatic Renewal:

1) Open Task Scheduler:
    Press Win + R, type taskschd.msc, and press Enter to open Task Scheduler.

2) Create a New Task:
    In the Task Scheduler, click on Create Basic Task in the right-hand panel.

3) Name the Task:
    Give your task a name, such as "KMS Auto Renewal."

4) Set the Trigger:
    Set the task to run daily. You can also set it to run weekly or monthly, but daily ensures that the activation will always be renewed well before it expires.

5) Set the Action:
    Choose the action "Start a Program."

6) Program to Run:
    In the "Program/script" field, enter the following:

      ```cscript.exe```

    In the "Add arguments (optional)" field, enter the following:

    ```C:\Windows\System32\slmgr.vbs /ato```

    This command will attempt to reactivate Windows using KMS whenever the task runs.

7) Set Additional Conditions:

    You can further refine when the task runs (e.g., only when the computer is idle, connected to AC power, etc.), but the default settings should work fine for most users.

8) Save the Task:

    Finish creating the task, and it will automatically run at the set intervals to renew your KMS activation.


