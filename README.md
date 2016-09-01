# Watchdog
Class for logging excessive blocking on the main thread

---

Class for logging excessive blocking on the main thread. It watches the main thread and checks if it doesn’t get blocked for more than defined threshold. You can also inspect which part of your code is blocking the main thread.

##Usage

When the app initialize , add a watch dog and actively monitoring the main thread.

```
Watchdog *dog = [[Watchdog alloc] initWithThreshold:4.0 andStrictMode:YES];

```

Also you can call the function below to customizea watch dog which can use your design reaction.

```
/**
 Initializes an instance of a watch dog to keep monitoring main thread.
 
 @param threshold the time interval for watching.
 
 @param strict customize reaction.
 
 @return An initialized watch dog, actively monitoring the main thread.
 */
- (instancetype)initWithThreshold:(double)threshold
                 andFiredCallback:(block)handler;

```

