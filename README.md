# Objective-C Core Data Concurrency Bug

This repository demonstrates a common concurrency issue in Objective-C when working with Core Data's `NSManagedObjectContext`.  Attempting to access and modify the context from a thread other than the one it was created on can result in crashes or unpredictable behavior.

## Problem

The `bug.m` file contains code that attempts to save the context from a background thread. This is incorrect and can lead to crashes because `NSManagedObjectContext` is not thread-safe.

## Solution

The `bugSolution.m` file shows the correct approach, using `NSManagedObjectContext`'s concurrency features (e.g., creating a child context on a background thread) to perform operations safely.