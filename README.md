# **🛠️ Windows and Office Activation Scripts**




## **Introduction**

Welcome to the Windows and Office Activation Scripts repository! This collection of scripts is designed to help you activate various versions of Microsoft Windows and Office products using the KMS (Key Management Service) and MAS (Microsoft Activation Scripts) methods.<br>
These scripts simplify the activation process while offering flexibility for different product versions.<br>


### 📋 What's Included

This repository provides batch scripts for the following products:

- Windows 10 Activation
  
- Windows 11 Activation

- Office 365 ProPlus Activation

- Microsoft Office 2019 Activation

- Microsoft Office 2021 Activation

<br>

Each script is designed to streamline the activation process and includes built-in notifications for successful activations.

<br><br>




## **⚙️ Activation Methods**

### **1. MAS (Microsoft Activation Scripts)**
MAS offers a more versatile range of activation options, including the popular HWID (Hardware ID) method, which provides permanent activation. Unlike KMS, MAS does not require periodic reactivation, making it a convenient option for those seeking a more permanent solution.

**How It Works:** MAS activates Windows and Office products by creating a digital license that is tied to your hardware. <br>
**Supported Products:** Windows 10, Windows 11, and Office products.

<br>


### **2. KMS (Key Management Service)**
KMS is a well-known method for activating Windows and Office products. This method works by connecting your system to a KMS server, which provides activation for 180 days. The activation can be renewed automatically, ensuring that your product remains active.

**How It Works:** The script applies a generic KMS key to your system and points it to an external KMS server for activation. <br>
**Supported Products:** Windows 10, Windows 11, Office 365 ProPlus, Office 2019, and Office 2021.

**Note:** KMS activation is temporary and must be renewed every 180 days.

<br><br>




## 🛠️ Usage
### Activating using MAS:
**Method 1 - PowerShell (Recommended):**

1. Right-click on the Windows start menu and select PowerShell or Terminal (Not CMD).
   
2. Copy and paste the code below and press enter  
    ```
    irm https://get.activated.win | iex
    ```
    or (deprecated, will be retired on Aug 31 2024, use above instead)  
    ```
    irm https://massgrave.dev/get | iex
    ```

3. You will see the activation options. Follow the on-screen instructions. That's all. :)
   
<br>


### Activating using KMS:

1. Download and extract the [ZIP file](https://github.com/eliyaballout/Activation/archive/refs/heads/main.zip).
   
2. Choose the script that matches your product (e.g., Windows11.bat for Windows 11).
   
3. Run the script as an administrator: Right-click the `.bat` file and choose **Run as administrator**.
  
4. Enjoy your activated product!

<br>

**Setting Up Auto-Renewal for KMS Activation**

1. **Ensure Initial KMS Activation:** <br>
    First, activate your Windows installation using the KMS method. This will activate Windows for 180 days.

2. **Set Up Automatic Renewal via Task Scheduler:** <br>
    You can create a scheduled task that will automatically renew the activation before it expires. This way, your system will periodically contact the KMS server and renew the activation without you needing to do anything.

3. **Steps to Create a Scheduled Task for Automatic Renewal:** <br>

   1. **Open Task Scheduler:** <br>
       Press Win + R, type `taskschd.msc`, and press Enter to open Task Scheduler.

   2. **Create a New Task:** <br>
       In the Task Scheduler, click on `Create Basic Task` in the right-hand panel.

   3. **Name the Task:** <br>
       Give your task a name, such as "Windows Auto Renewal".

   4. **Set the Trigger:** <br>
       Set the task to run daily. You can also set it to run weekly or monthly, but daily ensures that the activation will always be renewed well before it expires.

   5. **Set the Action:** <br>
       Choose the action "Start a Program".

   6. **Program to Run:** <br>
       In the "Program/script" field, enter the following:
        ```
        cscript.exe
        ```
       

       In the "Add arguments (optional)" field, enter the following:
       ```
       C:\Windows\System32\slmgr.vbs /ato
       ```

       This command will attempt to reactivate Windows using KMS whenever the task runs.

   7. **Set Additional Conditions:** <br>
       You can further refine when the task runs (e.g., only when the computer is idle, connected to AC power, etc.), but the default settings should work fine for most users.

   8. **Save the Task:** <br>
       Finish creating the task, and it will automatically run at the set intervals to renew your KMS activation.

<br><br>




## **Important Note**

Please be aware that using KMS and MAS activation methods may not comply with Microsoft’s licensing terms for personal use. It is recommended to obtain a legitimate license key from Microsoft for long-term, legal use.
