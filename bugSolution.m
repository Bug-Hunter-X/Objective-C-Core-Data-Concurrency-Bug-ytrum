To rectify this, employ Core Data's concurrency model.  Create a private queue context and perform operations on this child context.  Then, save the parent context on the main thread to ensure the changes are persisted.

```objectivec
// Correct: Using a child context for background operations
NSManagedObjectContext *privateContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
privateContext.parentContext = self.managedObjectContext;

dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    [privateContext performBlock:^ {
        // Perform operations on privateContext
        // ...
        NSError *error = nil;
        if (![privateContext save:&error]) {
            NSLog(@