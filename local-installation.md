## Local Installation Guide
> [!NOTE]
> Before you start, ensure that you have Docker and Docker Compose installed.

1. **Prepare the configuration file**
   - Locate the `.env.example` file in the root directory of the project
   - Create a copy of this file and rename it to `.env`
   - Example command in terminal:
     ```
     cp .env.example .env
     ```

2. **Set up the password**
   - Open the `.env` file in any text editor
   - Find the line containing `<secret>`
   - Replace `<secret>` with your own secure password
   - Save the changes to the file

3. **Launch the application**
   - Open a terminal (command line)
   - Navigate to the directory containing the application code
   - Run the following command:
     ```
     docker compose up -d
     ```
   - This command will start the application in the background using Docker

4. **Verification**
   - After the command executes successfully, the application should be running
   - Open a web browser and go to: http://localhost
   - If the application is running correctly, you should see the application's web interface
