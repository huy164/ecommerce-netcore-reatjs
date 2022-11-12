using System;
using System.IO;

namespace Back.Common
{
    public class MyDataHandler
    {
      
        public static void  CopyDir(string sourceFolder, string destFolder)
        {
            if (!Directory.Exists(sourceFolder))
            {
                return;
            }
            if (!Directory.Exists(destFolder))
                Directory.CreateDirectory(destFolder);

            // Get Files & Copy
            string[] files = Directory.GetFiles(sourceFolder);
            foreach (string file in files)
            {
                string name = Path.GetFileName(file);

                // ADD Unique File Name Check to Below!!!!
                string dest = Path.Combine(destFolder, name);
                File.Copy(file, dest);
            }

            // Get dirs recursively and copy files
            string[] folders = Directory.GetDirectories(sourceFolder);
            foreach (string folder in folders)
            {
                string name = Path.GetFileName(folder);
                string dest = Path.Combine(destFolder, name);
                CopyDir(folder, dest);
            }
        }

        public static void MoveDir(string sourceFolder, string destFolder)
        {
            if (!Directory.Exists(sourceFolder))
            {
                return;
            }
            CopyDir(sourceFolder, destFolder);
            Directory.Delete(sourceFolder, true);
        }

    }
}
