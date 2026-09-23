# Linux Lab Assignment

# Mounting Using UUID Instead of Device Name

## Aim

To mount a filesystem using UUID for better reliability.

---

## Theory

Linux device names such as:

```
/dev/sdb1
/dev/sdc1
```

may change after reboot.

UUID (Universally Unique Identifier) provides a permanent reference for a filesystem.

Mounting using UUID is safer and more reliable.

---

## Commands Used

Find UUID:

```bash
blkid
```

Create mount directory:

```bash
mkdir /mnt/uuiddata
```

Mount using UUID:

```bash
mount UUID=<your-uuid> /mnt/uuiddata
```

Verify mount:

```bash
df -h
```

---

## Student Instructions

1. Edit `mount_uuid.sh`
2. Replace:

```
YOUR_UUID
```

with the filesystem UUID.

3. Give execution permission:

```bash
chmod +x mount_uuid.sh
```

4. Run:

```bash
sudo ./mount_uuid.sh
```

5. Push your code to GitHub.

---

## Expected Result

The filesystem should be mounted successfully.

Example:

```
Filesystem      Size Used Avail Mounted on

/dev/sdb1       10G  1G    9G   /mnt/uuiddata
```

---

## Evaluation

| Test | Marks |
|------|-------|
| Script exists | 10 |
| blkid command | 20 |
| Creates mount directory | 20 |
| UUID mounting command | 30 |
| df command verification | 20 |
