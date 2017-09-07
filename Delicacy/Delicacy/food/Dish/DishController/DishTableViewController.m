//
//  DishTableViewController.m
//  Delicacy
//
//  Created by mac on 2017/9/5.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "DishTableViewController.h"
#import "DishTableViewCell.h"
#import "DishModel.h"
#import "DishHeaderView.h"

@interface DishTableViewController ()

@property (nonatomic, strong) NSMutableArray<SectionModel*>* sectionModels;

@end

@implementation DishTableViewController

-(void)scrollRowWithCategoryId:(NSInteger)categoryId{
    __block NSInteger index = -1;

    [self.sectionModels enumerateObjectsUsingBlock:^(SectionModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.categoryID == categoryId) {
            index = idx;
            *stop = YES;
        }
    }];
    
    if (index > -1) {
         [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

#pragma mark -
#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DishTableViewCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DishHeaderView class]) bundle:[NSBundle mainBundle]]  forHeaderFooterViewReuseIdentifier:@"header"];
    
    self.sectionModels = [NSMutableArray array];
    
    for (int i = 0; i < 30; i++) {
        SectionModel* cModel = [[SectionModel alloc] init];
        cModel.categoryID = i;
        cModel.categoryName = [NSString stringWithFormat:@"嘴爷分类%d", i];
        cModel.dishes = [DishModel forgeDishes:cModel.categoryID];
        [self.sectionModels addObject:cModel];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.sectionModels.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    SectionModel* model = self.sectionModels[section];
    
    return model.dishes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    

    DishTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    SectionModel* model = self.sectionModels[indexPath.section];
    DishModel* dModel = model.dishes[indexPath.row];
    cell.model = dModel;
    
//    如果在cell的layoutSubView里去赋值，并没有自动调节label的高度，需要提前赋值
    cell.dishDetailLabel.text = [NSString stringWithFormat:@"%@", dModel.dishDetail];
    // Configure the cell...
    
    return cell;
}

#pragma mark -
#pragma mark - Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SectionModel* model = self.sectionModels[indexPath.section];
    DishModel* dishModel = model.dishes[indexPath.row];
    if (self.delegate && [self.delegate respondsToSelector:@selector(dishTableViewController:didSelectDish:)]) {
        [self.delegate dishTableViewController:self didSelectDish:dishModel];
    }
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewAutomaticDimension;
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    NSLog(@"willDisplayHeaderView");
    
    
    NSArray* indexPathes = [tableView indexPathsForVisibleRows];
    if (indexPathes.count == 0) {
        return;
    }
    
    NSIndexPath* indexPath = [indexPathes firstObject];//找可见的cell中最小的索引
    SectionModel* model = self.sectionModels[indexPath.section];
    if (tableView.isDragging && self.delegate && [self.delegate respondsToSelector:@selector(dishTableViewController:willShowCategoryId:)]) {
        [self.delegate dishTableViewController:self willShowCategoryId:model.categoryID];
    }
    
}

-(void)tableView:(UITableView *)tableView didEndDisplayingHeaderView:(nonnull UIView *)view forSection:(NSInteger)section{
    NSLog(@"didEndDisplayingHeaderView");
    
    NSArray* indexPathes = [tableView indexPathsForVisibleRows];
    if (indexPathes.count == 0) {
        return;
    }
    
    NSIndexPath* indexPath = [indexPathes firstObject];//找可见的cell中最小的索引
    SectionModel* model = self.sectionModels[indexPath.section];
    if (tableView.isDragging &&  self.delegate && [self.delegate respondsToSelector:@selector(dishTableViewController:willShowCategoryId:)]) {
        [self.delegate dishTableViewController:self willShowCategoryId:model.categoryID];
    }

}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    DishHeaderView* headerView = (DishHeaderView*)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    SectionModel* model = self.sectionModels[section];
    headerView.model = model;
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 30;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
