//
//  RFMonentCell.m
//  RFAutoLayoutDemo_Masonry_FDTemplateLayoutCell
//
//  Created by riceFun on 2018/9/27.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import "RFMonentCell.h"
@interface RFMonentCell()
@property (nonatomic, strong)  UILabel *titleLabel;
@property (nonatomic, strong)  UILabel *contentLabel;
@property (nonatomic, strong)  UIImageView *contentImageView;
@property (nonatomic, strong)  UILabel *usernameLabel;
@property (nonatomic, strong)  UILabel *timeLabel;

@end

@implementation RFMonentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.contentImageView];
        [self.contentView addSubview:self.usernameLabel];
        [self.contentView addSubview:self.timeLabel];
        
        //布局
        [self configLayout];
    }
    return self;
}

-(void)configLayout{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(16);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-16);
        make.top.mas_equalTo(self.contentView.mas_top).offset(8);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(8);
        make.left.mas_equalTo(self.contentView.mas_left).offset(16);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-16);
    }];
    
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(16);
        make.top.mas_equalTo(self.contentLabel.mas_bottom).offset(8);
        make.right.lessThanOrEqualTo(self.contentView.mas_right).offset(-16);
//        make.right.mas_equalTo(self.contentView.mas_right).offset(-16);
    }];
    
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(16);
        make.top.mas_equalTo(self.contentImageView.mas_bottom).offset(8);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-8).priority(900);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-16);
        make.top.mas_equalTo(self.contentImageView.mas_bottom).offset(8);
        make.bottom.mas_equalTo(self.usernameLabel.mas_bottom);
    }];
}

-(void)layoutSubviews{
    [super layoutSubviews];
//    [self configLayout];
}

#pragma mark getter&setter
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor darkGrayColor];
        _titleLabel.font = KFont(18);
        _titleLabel.numberOfLines = 100;
    }
    return _titleLabel;
}

-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.textColor = [UIColor grayColor];
        _contentLabel.font = KFont(15);
        _contentLabel.numberOfLines = 100;
    }
    return _contentLabel;
}

-(UIImageView *)contentImageView{
    if (!_contentImageView) {
        _contentImageView = [[UIImageView alloc]init];
    }
    return _contentImageView;
}

-(UILabel *)usernameLabel{
    if (!_usernameLabel) {
        _usernameLabel = [[UILabel alloc]init];
        _usernameLabel.textColor = [UIColor lightGrayColor];
        _usernameLabel.font = KFont(14);
        _usernameLabel.numberOfLines = 100;
    }
    return _usernameLabel;
}

-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.textColor = [UIColor blueColor];
        _timeLabel.font = KFont(14);
        _timeLabel.numberOfLines = 100;
    }
    return _timeLabel;
}


-(void)setModel:(MonentModel *)model{
    _model = model;
    self.titleLabel.text = model.title;
    self.contentLabel.text = model.content;
    self.contentImageView.image = model.imageName.length > 0 ? [UIImage imageNamed:model.imageName] : nil;
    self.usernameLabel.text = model.username;
    self.timeLabel.text = model.time;
    
//    [self layoutIfNeeded];
}


@end
