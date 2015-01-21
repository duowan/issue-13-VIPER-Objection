//
//  VTDCoreDataStore.m
//  objectionViper
//
//  Created by 崔 明辉 on 15/1/20.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "VTDCoreDataStore.h"

@interface VTDCoreDataStore ()

@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation VTDCoreDataStore

- (instancetype)init {
    self = [super init];
    if (self) {
        self.managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
                                           initWithManagedObjectModel:self.managedObjectModel];
        NSError *error = nil;
        NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager]
                                                 URLsForDirectory:NSDocumentDirectory
                                                 inDomains:NSUserDomainMask] lastObject];
        NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption: @(YES),
                                  NSInferMappingModelAutomaticallyOption: @(YES)};
        NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"VIPER-TODO.sqlite"];
        [self.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                      configuration:nil
                                                                URL:storeURL
                                                            options:options
                                                              error:&error];
        self.managedObjectContext = [[NSManagedObjectContext alloc]
                                     initWithConcurrencyType:NSMainQueueConcurrencyType];
        self.managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
        self.managedObjectContext.undoManager = nil;
    }
    return self;
}

- (void)fetchEntriesWithEntryName:(NSString *)entryName
                        predicate:(NSPredicate *)predicate
                  sortDescriptors:(NSArray *)sortDescriptors
                  completionBlock:(VTDCoreDataStoreFetchCompletionBlock)completionBlock {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entryName];
    request.predicate = predicate;
    request.sortDescriptors = sortDescriptors;
    [self.managedObjectContext performBlock:^{
        NSArray *results = [self.managedObjectContext executeFetchRequest:request error:NULL];
        if (completionBlock) {
            completionBlock(results);
        }
    }];
}

- (VTDManagedTodoItem *)newTodoItem {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"TodoItem"
                                                         inManagedObjectContext:self.managedObjectContext];
    VTDManagedTodoItem *newEntry = [(VTDManagedTodoItem *)[NSManagedObject alloc]
                                    initWithEntity:entityDescription
                                    insertIntoManagedObjectContext:self.managedObjectContext];
    return newEntry;
}

- (void)saveWithCompletionBlock:(VTDCoreDataStoreCommitCompletionBlock)completionBlock
                   failureBlock:(VTDCoreDataStoreCommitFailureBlock)failureBlock {
    NSError *error = nil;
    [self.managedObjectContext save:&error];
    if (error == nil) {
        if (completionBlock) {
            completionBlock();
        }
    }
    else {
        if (failureBlock) {
            failureBlock();
        }
    }
}

@end
