# Watchdog
Class for logging excessive blocking on the main thread

---

Class for logging excessive blocking on the main thread. It watches the main thread and checks if it doesn’t get blocked for more than defined threshold. You can also inspect which part of your code is blocking the main thread.