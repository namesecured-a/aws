---
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html
Format and mount attached volume

2. view available disk devices
lsblk

3. determine file system
file -s /dev/xvdf

4. create file system
mkfs -t xfs /dev/xvdf

5. create mount point
mkdir /data

6. mount volume to mount point
mount /dev/xvdf /data

6.1 wrong fs type, bad superblock error
# to skip uuid verificaiton
https://linux-tips.com/t/xfs-filesystem-has-duplicate-uuid-problem/181
https://medium.com/@ismailyenigul/aws-ebs-snapshot-mount-failure-for-xfs-filesystem-due-duplicate-uuid-b1c6a591a1bb
mount -o nouuid /dev/xvdg /data

6.2 or to generate new uuid
xfs_admin -U generate /dev/xvdg

output will be like
> Clearing log and setting UUID
> writing all SBs
> new UUID = 01fbb5f2-1ee0-4cce-94fc-024efb3cd3a4

---
Change EBS DeleteOnTerminationFlag
https://www.petewilcock.com/how-to-modify-deletion-on-termination-flag-for-ebs-volume-on-running-ec2-instance/
aws ec2 modify-instance-attribute --instance-id i-a3ef245 --block-device-mappings '[{\"DeviceName\": \"/dev/sdg\",\"Ebs\":{\"DeleteOnTermination\":true}}]'