## ✅ Coding Question #8 — Check if a Website is Up (Health Check Script)

### Question

Write a **shell script** to:

* Check if a **website is reachable**
* If the website is **down**, print an alert

Example website:

```text
https://example.com
```

---

## 💡 What the interviewer is testing

They want to see if you know:

* `curl` or `wget`
* HTTP status codes
* conditional checks in shell

This is a **very common monitoring task** in DevOps/SRE.

---

# 🧪 Solution Script

```bash
#!/bin/bash

url="https://example.com"

status_code=$(curl -o /dev/null -s -w "%{http_code}" $url)

if [ $status_code -eq 200 ]
then
    echo "Website is UP"
else
    echo "ALERT: Website is DOWN (Status: $status_code)"
fi
```

---

# 🔎 Explanation

| Command             | Purpose                |
| ------------------- | ---------------------- |
| `curl`              | Sends HTTP request     |
| `-o /dev/null`      | Ignore response body   |
| `-s`                | Silent mode            |
| `-w "%{http_code}"` | Print HTTP status code |

---

## 📌 Example Outputs

### Website working

```
Website is UP
```

### Website down

```
ALERT: Website is DOWN (Status: 500)
```

---

# ⭐ Follow-up Questions Interviewers Ask

### ❓ How to run this every minute?

Using **cron**

```
* * * * * /path/website_check.sh
```

---

### ❓ How to check response time?

```
curl -o /dev/null -s -w "%{time_total}\n" https://example.com
```

---

### ❓ How to check multiple websites?

Example:

```bash
for site in google.com github.com example.com
do
    curl -Is $site | head -1
done
```

---

# 🧠 Real SRE Insight

This simple logic is used inside real monitoring tools like:

* uptime monitoring
* load balancer health checks
* Kubernetes readiness probes
* Cloud load balancers

For example:

* Kubernetes `livenessProbe`
* AWS ALB health checks
* Prometheus blackbox exporter

---

When you're ready, type **Next**.

The next one (**Question #9**) is another **very popular DevOps interview problem**:

> **Write a script to automatically back up a directory with timestamp.**
