//
//  UITableView+Blocks.swift
//  CoreDemo
//
//  Created by weiwei.li on 2019/1/9.
//  Copyright © 2019 dd01.leo. All rights reserved.
//

import Foundation
import UIKit


extension UITableView {
    fileprivate struct TableViewKey {
        //MARK: -- UITableViewDataSource
        static var TableViewNumberOfRowsInSectionKey = "TableViewNumberOfRowsInSectionKey"
        static var TableViewCellForRowAtIndexPathKey = "TableViewCellForRowAtIndexPathKey"
        static var TableViewNumberOfSectionsKey = "TableViewNumberOfSectionsKey"
        static var TableViewTitleForHeaderInSectionKey = "TableViewTitleForHeaderInSectionKey"
        static var TableViewTitleForFooterInSectionKey = "TableViewTitleForFooterInSectionKey"
        static var TableViewCanEditRowAtIndexPathKey = "TableViewCanEditRowAtIndexPathKey"
        static var TableViewCanMoveRowAtIndexPathKey = "TableViewCanMoveRowAtIndexPathKey"
        static var TableViewSectionIndexTitlesKey = "TableViewSectionIndexTitlesKey"
        static var TableViewSectionForSectionIndexTitleAtIndexKey = "TableViewSectionForSectionIndexTitleAtIndexKey"
        static var TableViewCommitEditingStyleForRowAtIndexPathKey = "TableViewcommitEditingStyleForRowAtIndexPathKey"
        static var TableViewMoveRowAtSourceIndexPathtoDestinationIndexPathKey = "TableViewMoveRowAtSourceIndexPathtoDestinationIndexPathKey"

        //MARK: -- UITableViewDelegate
        static var TableViewWillDisplayCellForRowAtIndexPathKey = "TableViewWillDisplayCellForRowAtIndexPathKey"
        static var TableViewWillDisplayHeaderViewForSectionKey = "TableViewWillDisplayHeaderViewForSectionKey"
        static var TableViewWillDisplayFooterViewForSectionKey = "TableViewWillDisplayFooterViewForSectionKey"
        static var TableViewDidEndDisplayingforRowAtIndexPathKey = "TableViewDidEndDisplayingforRowAtIndexPathKey"
        static var TableViewDidEndDisplayingHeaderViewForSectionKey = "TableViewDidEndDisplayingHeaderViewForSectionKey"
        static var TableViewDidEndDisplayingFooterViewforSectionKey = "TableViewDidEndDisplayingFooterViewforSectionKey"
        static var TableViewHeightForRowAtIndexPathKey = "TableViewHeightForRowAtIndexPathKey"
        static var TableViewHeightForHeaderInSectionKey = "TableViewHeightForHeaderInSectionKey"
        static var TableViewHeightForFooterInSectionKey = "TableViewHeightForFooterInSectionKey"
        static var TableViewEstimatedHeightForRowAtKey = "TableViewEstimatedHeightForRowAtKey"
        static var TableViewEstimatedHeightForHeaderInSectionKey = "TableViewestimatedHeightForHeaderInSectionKey"
        static var TableViewEstimatedHeightForFooterInSectionKey = "TableViewestimatedHeightForFooterInSectionKey"
        static var TableViewViewForHeaderInSectionKey = "TableViewViewForHeaderInSectionKey"
        static var TableViewViewForFooterInSectionKey = "TableViewViewForFooterInSectionKey"
        static var TableViewAccessoryButtonTappedForRowWithKey = "TableViewAccessoryButtonTappedForRowWithKey"
        static var TableViewShouldHighlightRowAtIndexPathKey = "TableViewShouldHighlightRowAtIndexPathKey"
        static var TableViewDidHighlightRowAtIndexPathKey = "TableViewDidHighlightRowAtIndexPathKey"
        static var TableViewDidUnhighlightRowAtIndexPathKey = "TableViewDidUnhighlightRowAtIndexPathKey"
        static var TableViewWillSelectRowAtIndexPathKey = "TableViewWillSelectRowAtIndexPathKey"
        static var TableViewWillDeselectRowAtIndexPathKey = "TableViewWillDeselectRowAtIndexPathKey"
        static var TableViewDidSelectRowAtIndexPathKey = "TableViewDidSelectRowAtIndexPathKey"
        static var TableViewDidDeselectRowAtIndexPathKey = "TableViewDidDeselectRowAtIndexPathKey"
        static var TableViewEditingStyleForRowAtIndexPathKey = "TableViewEditingStyleForRowAtIndexPathKey"
        static var TableViewTitleForDeleteConfirmationButtonForRowAtIndexPathKey = "TableViewTitleForDeleteConfirmationButtonForRowAtIndexPathKey"
        static var TableViewEditActionsForRowAtIndexPathKey = "TableViewEditActionsForRowAtIndexPathKey"
        static var TableViewLeadingSwipeActionsConfigurationForRowAtIndexPathKey = "TableViewLeadingSwipeActionsConfigurationForRowAtIndexPathKey"
        static var TableViewTrailingSwipeActionsConfigurationForRowAtIndexPathKey = "TableViewTrailingSwipeActionsConfigurationForRowAtIndexPathKey"
        static var TableViewShouldIndentWhileEditingRowAtIndexPathKey = "TableViewShouldIndentWhileEditingRowAtIndexPathKey"
        static var TableViewWillBeginEditingRowAtIndexPathKey = "TableViewWillBeginEditingRowAtIndexPathKey"
        static var TableViewDidEndEditingRowAtIndexPathKey = "TableViewDidEndEditingRowAtIndexPathKey"
        //此协议暂时不实现
//        static var TableViewTargetIndexPathForMoveFromRowAtSourceIndexPathtoProposedIndexPathKey = "TableViewTargetIndexPathForMoveFromRowAtSourceIndexPathtoProposedIndexPathKey"
//        static var TableViewIndentationLevelForRowAtIndexPathKey = "TableViewIndentationLevelForRowAtIndexPathKey"
//        static var TableViewShouldShowMenuForRowAtIndexPathKey = "TableViewShouldShowMenuForRowAtIndexPathKey"
//        static var TableViewCanPerformActionforRowAtIndexPathWithSenderKey = "TableViewCanPerformActionforRowAtIndexPathWithSenderKey"
//        static var TableViewPerformActionforRowAtIndexPathWithSenderKey = "TableViewPerformActionforRowAtIndexPathWithSenderKey"
//        static var TableViewCanFocusRowAtIndexPathKey = "TableViewCanFocusRowAtIndexPathKey"
//        static var TableViewShouldUpdateFocusInContextKey = "TableViewShouldUpdateFocusInContextKey"
//        static var TableViewDidUpdateFocusInContextKey = "TableViewDidUpdateFocusInContextKey"
//        static var TableViewIndexPathForPreferredFocusedViewKey = "TableViewIndexPathForPreferredFocusedViewKey"
//        static var TableViewShouldSpringLoadRowAtIndexPathWithContextKey = "TableViewShouldSpringLoadRowAtIndexPathWithContextKey"
    }

    //MARK: - UITableviewDataSource
    fileprivate var numberOfRowsInSectionBlock:((UITableView,Int)->(Int))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewNumberOfRowsInSectionKey) as? ((UITableView,Int) -> (Int))
        }
        set(value) {
            setDataSource()
            objc_setAssociatedObject(self, &TableViewKey.TableViewNumberOfRowsInSectionKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var cellForRowAtIndexPathBlock:((UITableView,IndexPath)->(UITableViewCell))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewCellForRowAtIndexPathKey) as? ((UITableView,IndexPath) -> (UITableViewCell))
        }
        set(value) {
            setDataSource()
            objc_setAssociatedObject(self, &TableViewKey.TableViewCellForRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var numberOfSectionsBlock:((UITableView)->(Int))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewNumberOfSectionsKey) as? ((UITableView) -> (Int))
        }
        set(value) {
            setDataSource()
            objc_setAssociatedObject(self, &TableViewKey.TableViewNumberOfSectionsKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }

    fileprivate var titleForHeaderInSectionBlock:((UITableView, Int)->(String))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewTitleForHeaderInSectionKey) as? ((UITableView, Int) -> (String))
        }
        set(value) {
            setDataSource()
            objc_setAssociatedObject(self, &TableViewKey.TableViewTitleForHeaderInSectionKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var titleForFooterInSectionBlock:((UITableView, Int)->(String))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewTitleForFooterInSectionKey) as? ((UITableView, Int) -> (String))
        }
        set(value) {
            setDataSource()
            objc_setAssociatedObject(self, &TableViewKey.TableViewTitleForFooterInSectionKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var canEditRowAtIndexPathBlock:((UITableView, IndexPath)->(Bool))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewCanEditRowAtIndexPathKey) as? ((UITableView, IndexPath) -> (Bool))
        }
        set(value) {
            setDataSource()
            objc_setAssociatedObject(self, &TableViewKey.TableViewCanEditRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var canMoveRowAtIndexPathBlock:((UITableView, IndexPath)->(Bool))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewCanMoveRowAtIndexPathKey) as? ((UITableView, IndexPath) -> (Bool))
        }
        set(value) {
            setDataSource()
            objc_setAssociatedObject(self, &TableViewKey.TableViewCanMoveRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var sectionIndexTitlesBlock:((UITableView)->([String]?))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewSectionIndexTitlesKey) as? ((UITableView) -> ([String]?))
        }
        set(value) {
            setDataSource()
            objc_setAssociatedObject(self, &TableViewKey.TableViewSectionIndexTitlesKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var sectionForSectionIndexTitleAtIndexBlock:((UITableView, String, Int)->(Int))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewSectionForSectionIndexTitleAtIndexKey) as? ((UITableView, String, Int) -> (Int))
        }
        set(value) {
            setDataSource()
            objc_setAssociatedObject(self, &TableViewKey.TableViewSectionForSectionIndexTitleAtIndexKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var commitEditingStyleForRowAtIndexPathBlock:((UITableView, UITableViewCellEditingStyle, IndexPath)->())? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewCommitEditingStyleForRowAtIndexPathKey) as? ((UITableView, UITableViewCellEditingStyle, IndexPath) -> ())
        }
        set(value) {
            setDataSource()
            objc_setAssociatedObject(self, &TableViewKey.TableViewCommitEditingStyleForRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var moveRowAtSourceIndexPathtoDestinationIndexPathBlock:((UITableView, IndexPath, IndexPath)->())? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewMoveRowAtSourceIndexPathtoDestinationIndexPathKey) as? ((UITableView, IndexPath, IndexPath) -> ())
        }
        set(value) {
            setDataSource()
            objc_setAssociatedObject(self, &TableViewKey.TableViewMoveRowAtSourceIndexPathtoDestinationIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate func setDataSource() {
        if (dataSource == nil) || (dataSource?.isEqual(self) == false) {
            dataSource = self
        }
    }
    
    // MARK: - UITableVieDelegate
    fileprivate func setDelegate() {
        if (delegate == nil) || (delegate?.isEqual(self) == false) {
            delegate = self
        }
        
    }
    
    fileprivate var willDisplayCellForRowAtIndexPathBlock:((UITableView, UITableViewCell, IndexPath)->())? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewWillDisplayCellForRowAtIndexPathKey) as? ((UITableView, UITableViewCell, IndexPath) -> ())
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewWillDisplayCellForRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var willDisplayHeaderViewForSectionBlock:((UITableView, UIView, Section)->())? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewWillDisplayHeaderViewForSectionKey) as? ((UITableView, UIView, Section) -> ())
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewWillDisplayHeaderViewForSectionKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var willDisplayFooterViewForSectionBlock:((UITableView, UIView, Section)->())? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewWillDisplayFooterViewForSectionKey) as? ((UITableView, UIView, Section) -> ())
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewWillDisplayFooterViewForSectionKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var didEndDisplayingforRowAtIndexPathBlock:((UITableView, UITableViewCell, IndexPath)->())? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewDidEndDisplayingforRowAtIndexPathKey) as? ((UITableView, UITableViewCell, IndexPath) -> ())
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewWillDisplayFooterViewForSectionKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var didEndDisplayingHeaderViewForSectionBlock:((UITableView, UIView, Section)->())? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewDidEndDisplayingHeaderViewForSectionKey) as? ((UITableView, UIView, Section) -> ())
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewDidEndDisplayingHeaderViewForSectionKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var didEndDisplayingFooterViewforSectionBlock:((UITableView, UIView, Section)->())? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewDidEndDisplayingFooterViewforSectionKey) as? ((UITableView, UIView, Section) -> ())
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewDidEndDisplayingFooterViewforSectionKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var heightForRowAtIndexPathBlock:((UITableView, IndexPath)->(CGFloat))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewHeightForRowAtIndexPathKey) as? ((UITableView, IndexPath) -> (CGFloat))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewHeightForRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var heightForHeaderInSectionBlock:((UITableView, Section)->(CGFloat))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewHeightForHeaderInSectionKey) as? ((UITableView, Section) -> (CGFloat))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewHeightForHeaderInSectionKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var heightForFooterInSectionBlock:((UITableView, Section)->(CGFloat))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewHeightForFooterInSectionKey) as? ((UITableView, Section) -> (CGFloat))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewHeightForFooterInSectionKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var estimatedHeightForRowAtIndexPathBlock:((UITableView, IndexPath)->(CGFloat))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewEstimatedHeightForRowAtKey) as? ((UITableView, IndexPath) -> (CGFloat))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewEstimatedHeightForRowAtKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var estimatedHeightForHeaderInSectionBlock:((UITableView, Section)->(CGFloat))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewEstimatedHeightForHeaderInSectionKey) as? ((UITableView, Section) -> (CGFloat))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewEstimatedHeightForHeaderInSectionKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var estimatedHeightForFooterInSectionBlock:((UITableView, Section)->(CGFloat))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewEstimatedHeightForFooterInSectionKey) as? ((UITableView, Section) -> (CGFloat))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewEstimatedHeightForFooterInSectionKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var viewForHeaderInSectionBlock:((UITableView, Section)->(UIView?))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewViewForHeaderInSectionKey) as? ((UITableView, Section) -> (UIView?))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewViewForHeaderInSectionKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var viewForFooterInSectionBlock:((UITableView, Section)->(UIView?))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewViewForFooterInSectionKey) as? ((UITableView, Section) -> (UIView?))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewViewForFooterInSectionKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var accessoryButtonTappedForRowWithBlock:((UITableView, IndexPath)->())? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewAccessoryButtonTappedForRowWithKey) as? ((UITableView, IndexPath) -> ())
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewAccessoryButtonTappedForRowWithKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var shouldHighlightRowAtIndexPathBlock:((UITableView, IndexPath)->(Bool))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewShouldHighlightRowAtIndexPathKey) as? ((UITableView, IndexPath) -> (Bool))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewShouldHighlightRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var didHighlightRowAtIndexPathBlock:((UITableView, IndexPath)->())? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewDidHighlightRowAtIndexPathKey) as? ((UITableView, IndexPath) -> ())
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewDidHighlightRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var didUnhighlightRowAtIndexPathBlock:((UITableView, IndexPath)->())? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewDidUnhighlightRowAtIndexPathKey) as? ((UITableView, IndexPath) -> ())
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewDidUnhighlightRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var willSelectRowAtIndexPathBlock:((UITableView, IndexPath)->(IndexPath?))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewWillSelectRowAtIndexPathKey) as? ((UITableView, IndexPath) -> (IndexPath?))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewWillSelectRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
        
    fileprivate var willDeselectRowAtIndexPathBlock:((UITableView, IndexPath)->(IndexPath?))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewWillDeselectRowAtIndexPathKey) as? ((UITableView, IndexPath) -> (IndexPath?))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewWillDeselectRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var didSelectRowAtIndexPathBlock:((UITableView, IndexPath)->())? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewDidSelectRowAtIndexPathKey) as? ((UITableView, IndexPath) -> ())
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewDidSelectRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var didDeselectRowAtIndexPathBlock:((UITableView, IndexPath)->())? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewDidDeselectRowAtIndexPathKey) as? ((UITableView, IndexPath) -> ())
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewDidDeselectRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var editingStyleForRowAtIndexPathBlock:((UITableView, IndexPath)->(UITableViewCellEditingStyle))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewEditingStyleForRowAtIndexPathKey) as? ((UITableView, IndexPath) -> (UITableViewCellEditingStyle))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewEditingStyleForRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var titleForDeleteConfirmationButtonForRowAtIndexPathBlock:((UITableView, IndexPath)->(String?))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewTitleForDeleteConfirmationButtonForRowAtIndexPathKey) as? ((UITableView, IndexPath) -> (String?))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewTitleForDeleteConfirmationButtonForRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }

    fileprivate var editActionsForRowAtIndexPathBlock:((UITableView, IndexPath)->([UITableViewRowAction]?))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewEditActionsForRowAtIndexPathKey) as? ((UITableView, IndexPath) -> ([UITableViewRowAction]?))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewEditActionsForRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    @available(iOS 11.0, *)
    fileprivate var leadingSwipeActionsConfigurationForRowAtIndexPathBlock:((UITableView, IndexPath)->(UISwipeActionsConfiguration?))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewLeadingSwipeActionsConfigurationForRowAtIndexPathKey) as? ((UITableView, IndexPath) -> (UISwipeActionsConfiguration?))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewLeadingSwipeActionsConfigurationForRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    @available(iOS 11.0, *)
    fileprivate var trailingSwipeActionsConfigurationForRowAtIndexPathBlock:((UITableView, IndexPath)->(UISwipeActionsConfiguration?))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewTrailingSwipeActionsConfigurationForRowAtIndexPathKey) as? ((UITableView, IndexPath) -> (UISwipeActionsConfiguration?))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewTrailingSwipeActionsConfigurationForRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var shouldIndentWhileEditingRowAtIndexPathBlock:((UITableView, IndexPath)->(Bool))? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewShouldIndentWhileEditingRowAtIndexPathKey) as? ((UITableView, IndexPath) -> (Bool))
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewShouldIndentWhileEditingRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var willBeginEditingRowAtIndexPathBlock:((UITableView, IndexPath)->())? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewWillBeginEditingRowAtIndexPathKey) as? ((UITableView, IndexPath) -> ())
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewWillBeginEditingRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
    
    fileprivate var didEndEditingRowAtIndexPathBlock:((UITableView, IndexPath?)->())? {
        get {
            return objc_getAssociatedObject(self, &TableViewKey.TableViewDidEndEditingRowAtIndexPathKey) as? ((UITableView, IndexPath?) -> ())
        }
        set(value) {
            setDelegate()
            objc_setAssociatedObject(self, &TableViewKey.TableViewDidEndEditingRowAtIndexPathKey, value, .OBJC_ASSOCIATION_COPY);
        }
    }
}

// MARK: - Public Method
extension UITableView {
    // MARK: - UITableViewDataSource
    public func setNumberOfRowsInSectionBlock(_ handler: @escaping((_ tableView: UITableView,_ section: Section)->(Int))) {
        numberOfRowsInSectionBlock = handler
    }
    
    public func setCellForRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->(UITableViewCell))) {
        cellForRowAtIndexPathBlock = handler
    }
    
    public func setNumberOfSectionsBlock(_ handler: @escaping((_ tableView: UITableView)->(Int))) {
        numberOfSectionsBlock = handler
    }
    
    public func setTitleForHeaderInSectionBlock(_ handler: @escaping((_ tableView: UITableView, _ section: Section)->(String))) {
        titleForHeaderInSectionBlock = handler
    }
    
    public func setTitleForFooterInSectionBlock(_ handler: @escaping((_ tableView: UITableView, _ section: Section)->(String))) {
        titleForFooterInSectionBlock = handler
    }
    
    public func setCanEditRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView, _ indexPath: IndexPath)->(Bool))) {
        canEditRowAtIndexPathBlock = handler
    }
    
    public func setCanMoveRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView, _ indexPath: IndexPath)->(Bool))) {
        canMoveRowAtIndexPathBlock = handler
    }
    
    public func setSectionIndexTitlesBlock(_ handler: @escaping((_ tableView: UITableView)->([String]?))) {
        sectionIndexTitlesBlock = handler
    }
    
    public func setSectionForSectionIndexTitleAtIndexBlock(_ handler: @escaping((_ tableView: UITableView, _ title: String, _ index: Int)->(Int))) {
        sectionForSectionIndexTitleAtIndexBlock = handler
    }
    
    public func setCommitEditingStyleForRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView, _ editingStyle: UITableViewCellEditingStyle, _ indexPath: IndexPath)->())) {
        commitEditingStyleForRowAtIndexPathBlock = handler
    }
    
    public func setMoveRowAtSourceIndexPathtoDestinationIndexPathBlock(_ handler: @escaping((_ tableView: UITableView, _ sourceIndexPath: IndexPath,_ destinationIndexPath: IndexPath)->())) {
        moveRowAtSourceIndexPathtoDestinationIndexPathBlock = handler
    }
    
    // MARK: - UITableVieDelegate
    public func setWillDisplayCellForRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ cell: UITableViewCell, _ indexPath: IndexPath)->())) {
        willDisplayCellForRowAtIndexPathBlock = handler
    }
    
    public func setWillDisplayHeaderViewForSectionBlock(_ handler: @escaping((_ tableView: UITableView,_ view: UIView, _ section: Section)->())) {
        willDisplayHeaderViewForSectionBlock = handler
    }
    
    public func setWillDisplayFooterViewForSectionBlock(_ handler: @escaping((_ tableView: UITableView,_ view: UIView, _ section: Section)->())) {
        willDisplayFooterViewForSectionBlock = handler
    }
    
    public func setDidEndDisplayingforRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ cell: UITableViewCell, _ indexPath: IndexPath)->())) {
        didEndDisplayingforRowAtIndexPathBlock = handler
    }
    
    public func setDidEndDisplayingHeaderViewForSectionBlock(_ handler: @escaping((_ tableView: UITableView,_ view: UIView, _ section: Section)->())) {
        didEndDisplayingHeaderViewForSectionBlock = handler
    }
    
    public func setDidEndDisplayingFooterViewforSectionBlock(_ handler: @escaping((_ tableView: UITableView,_ view: UIView, _ section: Section)->())) {
        didEndDisplayingFooterViewforSectionBlock = handler
    }
    
    public func setHeightForRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->(CGFloat))) {
        heightForRowAtIndexPathBlock = handler
    }
    
    public func setHeightForHeaderInSectionBlock(_ handler: @escaping((_ tableView: UITableView,_ section: Section)->(CGFloat))) {
        heightForHeaderInSectionBlock = handler
    }
    
    public func setHeightForFooterInSectionBlock(_ handler: @escaping((_ tableView: UITableView,_ section: Section)->(CGFloat))) {
        heightForFooterInSectionBlock = handler
    }
    
    // MARK: - 自动估算的三个代理方法不提供实现，实现代理后此方法不在有效
//    public func setEstimatedHeightForRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->(CGFloat))) {
//        estimatedHeightForRowAtIndexPathBlock = handler
//    }
//
//    public func setEstimatedHeightForHeaderInSectionBlock(_ handler: @escaping((_ tableView: UITableView,_ section: Section)->(CGFloat))) {
//        estimatedHeightForHeaderInSectionBlock = handler
//    }
//
//    public func setEstimatedHeightForFooterInSectionBlock(_ handler: @escaping((_ tableView: UITableView,_ section: Section)->(CGFloat))) {
//        estimatedHeightForFooterInSectionBlock = handler
//    }
    
    public func setViewForHeaderInSectionBlock(_ handler: @escaping((_ tableView: UITableView,_ section: Section)->(UIView?))) {
        viewForHeaderInSectionBlock = handler
    }
    
    public func setViewForFooterInSectionBlock(_ handler: @escaping((_ tableView: UITableView,_ section: Section)->(UIView?))) {
        viewForFooterInSectionBlock = handler
    }
    
    public func setAccessoryButtonTappedForRowWithBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->())) {
        accessoryButtonTappedForRowWithBlock = handler
    }
    
    public func setShouldHighlightRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->(Bool))) {
        shouldHighlightRowAtIndexPathBlock = handler
    }
    
    public func setDidHighlightRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->())) {
        didHighlightRowAtIndexPathBlock = handler
    }
    
    public func setDidUnhighlightRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->())) {
        didUnhighlightRowAtIndexPathBlock = handler
    }

    public func setWillSelectRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->(IndexPath?))) {
        willSelectRowAtIndexPathBlock = handler
    }
    
    public func setWillDeselectRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->(IndexPath?))) {
        willDeselectRowAtIndexPathBlock = handler
    }
    
    public func setDidSelectRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->())) {
        didSelectRowAtIndexPathBlock = handler
    }
    
    public func setDidDeselectRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->())) {
        didDeselectRowAtIndexPathBlock = handler
    }
    
    public func setEditingStyleForRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->(UITableViewCellEditingStyle))) {
        editingStyleForRowAtIndexPathBlock = handler
    }
    
    public func setTitleForDeleteConfirmationButtonForRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->(String?))) {
        titleForDeleteConfirmationButtonForRowAtIndexPathBlock = handler
    }
    
    public func setEditActionsForRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->([UITableViewRowAction]?))) {
        editActionsForRowAtIndexPathBlock = handler
    }
    
    @available(iOS 11.0, *)
    public func setLeadingSwipeActionsConfigurationForRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->(UISwipeActionsConfiguration?))) {
        leadingSwipeActionsConfigurationForRowAtIndexPathBlock = handler
    }
    
    @available(iOS 11.0, *)
    public func setTrailingSwipeActionsConfigurationForRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->(UISwipeActionsConfiguration?))) {
        trailingSwipeActionsConfigurationForRowAtIndexPathBlock = handler
    }
    
    public func setShouldIndentWhileEditingRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->(Bool))) {
        shouldIndentWhileEditingRowAtIndexPathBlock = handler
    }
    
    public func setWillBeginEditingRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath)->())) {
        willBeginEditingRowAtIndexPathBlock = handler
    }
    
    public func setDidEndEditingRowAtIndexPathBlock(_ handler: @escaping((_ tableView: UITableView,_ indexPath: IndexPath?)->())) {
        didEndEditingRowAtIndexPathBlock = handler
    }
}

extension UITableView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let block = numberOfRowsInSectionBlock {
            return block(tableView, section)
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let block = cellForRowAtIndexPathBlock {
            return block(tableView, indexPath)
        }
        return UITableViewCell()
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        if let block = numberOfSectionsBlock {
            return block(tableView)
        }
        return 1
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let block = titleForHeaderInSectionBlock {
            return block(tableView, section)
        }
        return nil
    }

    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if let block = titleForFooterInSectionBlock {
            return block(tableView, section)
        }
        return nil
    }

    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if let block = canEditRowAtIndexPathBlock {
            return block(tableView, indexPath)
        }
        return false
    }

    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        if let block = canMoveRowAtIndexPathBlock {
            return block(tableView, indexPath)
        }
        return false
    }
    
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if let block = sectionIndexTitlesBlock {
            return block(tableView)
        }
        return nil
    }

    public func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        if let block = sectionForSectionIndexTitleAtIndexBlock {
            return block(tableView, title, index)
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        commitEditingStyleForRowAtIndexPathBlock?(tableView, editingStyle, indexPath)
    }

    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        moveRowAtSourceIndexPathtoDestinationIndexPathBlock?(tableView, sourceIndexPath, destinationIndexPath)
    }
}


extension UITableView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        willDisplayCellForRowAtIndexPathBlock?(tableView, cell, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        willDisplayHeaderViewForSectionBlock?(tableView, view, section)
    }

    public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        willDisplayFooterViewForSectionBlock?(tableView, view, section)
    }

    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        didEndDisplayingforRowAtIndexPathBlock?(tableView, cell, indexPath)
    }

    public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        didEndDisplayingHeaderViewForSectionBlock?(tableView, view, section)
    }
    
    public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        didEndDisplayingFooterViewforSectionBlock?(tableView, view, section)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let block = heightForRowAtIndexPathBlock {
            return block(tableView, indexPath)
        }
        return tableView.estimatedRowHeight
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let block = heightForHeaderInSectionBlock {
            return block(tableView, section)
        }
        return tableView.estimatedSectionHeaderHeight
    }

    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if let block = heightForFooterInSectionBlock {
            return block(tableView, section)
        }
        return tableView.estimatedSectionFooterHeight
    }
    
//    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        if let block = estimatedHeightForRowAtIndexPathBlock {
//            return block(tableView, indexPath)
//        }
//        return tableView.estimatedRowHeight
//    }
//
//    public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
//        if let block = estimatedHeightForHeaderInSectionBlock {
//            return block(tableView, section)
//        }
//        return tableView.estimatedSectionHeaderHeight
//    }
//
//    public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
//        if let block = estimatedHeightForFooterInSectionBlock {
//            return block(tableView, section)
//        }
//        return tableView.estimatedSectionFooterHeight
//    }

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let block = viewForHeaderInSectionBlock {
            return block(tableView, section)
        }
        return nil
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if let block = viewForFooterInSectionBlock {
            return block(tableView, section)
        }
        return nil
    }

    public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        accessoryButtonTappedForRowWithBlock?(tableView, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if let block = shouldHighlightRowAtIndexPathBlock {
            return block(tableView, indexPath)
        }
        return true
    }
    
    public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        didHighlightRowAtIndexPathBlock?(tableView, indexPath)
    }

    public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        didUnhighlightRowAtIndexPathBlock?(tableView, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let block = willSelectRowAtIndexPathBlock {
            return block(tableView, indexPath)
        }
        return indexPath
    }

    public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
        if let block = willDeselectRowAtIndexPathBlock {
            return block(tableView, indexPath)
        }
        return indexPath
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowAtIndexPathBlock?(tableView, indexPath)
    }

    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        didDeselectRowAtIndexPathBlock?(tableView, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if let block = editingStyleForRowAtIndexPathBlock {
            return block(tableView, indexPath)
        }
        return .none
    }

    public func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        if let block = titleForDeleteConfirmationButtonForRowAtIndexPathBlock {
            return block(tableView, indexPath)
        }
        return nil
    }
    
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if let block = editActionsForRowAtIndexPathBlock {
            return block(tableView, indexPath)
        }
        return nil
    }

    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if let block = leadingSwipeActionsConfigurationForRowAtIndexPathBlock {
            return block(tableView, indexPath)
        }
        return nil
    }

    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if let block = trailingSwipeActionsConfigurationForRowAtIndexPathBlock {
            return block(tableView, indexPath)
        }
        return nil
    }

    public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        if let block = shouldIndentWhileEditingRowAtIndexPathBlock {
            return block(tableView, indexPath)
        }
        return true
    }
    
    public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
        willBeginEditingRowAtIndexPathBlock?(tableView, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        didEndEditingRowAtIndexPathBlock?(tableView, indexPath)
    }
}
