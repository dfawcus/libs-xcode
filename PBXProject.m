#import "PBXCommon.h"
#import "PBXProject.h"

@implementation PBXProject

// Methods....
- (NSString *) developmentRegion // getter
{
  return developmentRegion;
}

- (void) setDevelopmentRegion: (NSString *)object; // setter
{
  ASSIGN(developmentRegion,object);
}

- (NSMutableArray *) knownRegions // getter
{
  return knownRegions;
}

- (void) setKnownRegions: (NSMutableArray *)object; // setter
{
  ASSIGN(knownRegions,object);
}

- (NSString *) compatibilityVersion // getter
{
  return compatibilityVersion;
}

- (void) setCompatibilityVersion: (NSString *)object; // setter
{
  ASSIGN(compatibilityVersion,object);
}

- (NSMutableArray *) projectReferences // getter
{
  return projectReferences;
}

- (void) setProjectReferences: (NSMutableArray *)object; // setter
{
  ASSIGN(projectReferences,object);
}

- (NSMutableArray *) targets // getter
{
  return targets;
}

- (void) setTargets: (NSMutableArray *)object; // setter
{
  ASSIGN(targets,object);
}

- (NSString *) projectDirPath // getter
{
  return projectDirPath;
}

- (void) setProjectDirPath: (NSString *)object; // setter
{
  ASSIGN(projectDirPath,object);
}

- (NSString *) projectRoot // getter
{
  return projectRoot;
}

- (void) setProjectRoot: (NSString *)object; // setter
{
  ASSIGN(projectRoot,object);
}

- (XCConfigurationList *) buildConfigurationList // getter
{
  return buildConfigurationList;
}

- (void) setBuildConfigurationList: (XCConfigurationList *)object; // setter
{
  ASSIGN(buildConfigurationList,object);
}

- (PBXGroup *) mainGroup // getter
{
  return mainGroup;
}

- (void) setMainGroup: (PBXGroup *)object; // setter
{
  ASSIGN(mainGroup,object);
}

- (NSString *) hasScannedForEncodings // getter
{
  return hasScannedForEncodings;
}

- (void) setHasScannedForEncodings: (NSString *)object; // setter
{
  ASSIGN(hasScannedForEncodings,object);
}

- (PBXGroup *) productRefGroup // getter
{
  return productRefGroup;
}

- (void) setProductRefGroup: (PBXGroup *)object; // setter
{
  ASSIGN(productRefGroup,object);
}

- (void) _sourceRootFromMainGroup
{
  PBXGroup *sourceGroup = [[mainGroup children] objectAtIndex: 0]; // get first group, which is the source group.
  NSString *sourceRoot = [sourceGroup path];
  
  if(sourceRoot == nil)
    {
      sourceRoot = @"";
    }

  setenv("SOURCE_ROOT",[sourceRoot cString],1);
  NSLog(@"\tSOURCE_ROOT = %@",sourceRoot);
}

- (BOOL) build
{
  NSLog(@"=== Building Project");
  [buildConfigurationList applyDefaultConfiguration];

  [self _sourceRootFromMainGroup];

  NSEnumerator *en = [targets objectEnumerator];
  id target = nil;
  BOOL result = YES;
  while((target = [en nextObject]) != nil && result)
    {
      result = [target build];
    }
  NSLog(@"=== Completed Building Project");
  return result;
}
@end
