//
//  ViewController.m
//  CodeQuestion
//
//  Created by HUANG WEILI on 3/9/15.
//  Copyright (c) 2015 HUANG WEILI. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "MovieList.h"
#import "MovieCell.h"
#import "Movie.h"
#import "UIImageView+AFNetworking.h"

#define MOVIE_URL @"http://api.movies.io/movies/search?q=hobbit"

@interface ViewController ()

@property(weak, nonatomic)IBOutlet UITableView *tableView;
@property(weak, nonatomic)IBOutlet UIActivityIndicatorView *indicator;
@property(nonatomic,strong)MovieList *movieList;

@end

@implementation ViewController
#pragma mark -
#pragma mark Request method
-(void)getMovieRequest
{
    [self.indicator startAnimating];
    
    __weak ViewController *weakSelf = self;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:MOVIE_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        weakSelf.movieList = [[MovieList alloc] initWithResult:responseObject];
        [weakSelf.indicator stopAnimating];
        [weakSelf.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [weakSelf.indicator stopAnimating];
    }];
}

#pragma mark -
#pragma mark Delegate method
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movieList.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Movie *movie = [self.movieList.data objectAtIndex:indexPath.row];
    cell.nameLabel.text = movie.title;
    cell.yearLabel.text = movie.year;
    cell.ratingLabel.text = movie.rating;
    
    if (movie.posterUrl) {
        __weak MovieCell *weakCell = cell;
        [cell.posterImageView setImageWithURLRequest:[NSURLRequest requestWithURL:movie.posterUrl] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response,UIImage *image){
            weakCell.posterImageView.image = image;
            
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response,NSError *error){
            
        }];
    }
    
    return cell;
}

#pragma mark -
#pragma mark View life cycle method

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getMovieRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
