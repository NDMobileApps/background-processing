i# This Code is Not Multi-Threaded
This sample demonstrates asynchronous (background) processing.  **However**, there is only *ONE* thread used in this example.  When we do this... 

```sh
dispatch_async( dispatch_get_main_queue() ) {
    // background code
}
```
We are telling iOS to run some code "in the background" on the main thread (aka queue) -- the same thread we are already executing on.  So if it's not on a background thread, what do we mean by "background?" Well, it means that iOS will schedule the part marked "background code" with the CPU such that it runs (more or less) concurrently with everything else.  This is how multitasking typically occurs; it's an illusion of CPU time-slicing.  So when we do this:
```sh
print("one")
dispatch_async( dispatch_get_main_queue() ) {
    print("two")
}
print("three")
```

There is no real guarantee as to the order of printing "two" and "three."  It depends on how the CPU schedules the asynchronous job and the next line, where "three" is printed.

However, if "print("two")" were a long-running task like decompressing an archive, it would finish later, and that code would be reached when it was done.

# Actual Multi-threading

It is possible to tell iOS to run a job on a background queue.  

iOS has several named queues you can invoke; Ray Wenderlich's [Grand Central Dispatch](http://www.raywenderlich.com/79149/grand-central-dispatch-tutorial-swift-part-1) tutorial spells most of it out.  Just be sure what if you *do* select a queue other than "main," that you dispatch *back* to main before doing anything with the UI (such as updating a label outlet).

# Synchronous calling

Everything I've shown you so far has been *asynchronous* -- that is, it does not wait to execute and returns control immediately to the next line.  It's possible to do dispatch_sync, but you need to understand what you're doing so you don't cause a deadlock!  Read Ray Wenderlich for more.



