#import <Foundation/Foundation.h>

// Local includes
#import "PBXCoder.h"


@interface PBXGroup : NSObject
{
  NSString *sourceTree;
  NSMutableArray *children;
  NSString *name;
  NSString *tabWidth;
  NSString *usesTabs;
}

// Methods....
- (NSString *) sourceTree; // getter
- (void) setSourceTree: (NSString *)object; // setter
- (NSMutableArray *) children; // getter
- (void) setChildren: (NSMutableArray *)object; // setter
- (NSString *) name; // getter
- (void) setName: (NSString *)object; // setter

@end