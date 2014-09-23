/**
 * ownCloud - News
 *
 * This file is licensed under the Affero General Public License version 3 or
 * later. See the COPYING file.
 *
 * @author Bernhard Posselt <dev@bernhard-posselt.com>
 * @copyright Bernhard Posselt 2014
 */
describe('NavigationController', function () {
    'use strict';

    var controller;

    beforeEach(module('News', function ($provide) {
        $provide.value('BASE_URL', 'base');
        $provide.value('FEED_TYPE', {
            FEED: 0,
            FOLDER: 1,
            STARRED: 2,
            SUBSCRIPTIONS: 3,
            SHARED: 4
        });
        $provide.constant('ITEM_BATCH_SIZE', 5);
    }));

    beforeEach(inject(function ($controller, FeedResource) {
        controller = $controller('NavigationController');
        FeedResource.receive([
            {id: 1, folderId: 3, url: 'ye', unreadCount: 45},
            {id: 2, folderId: 4, url: 'sye', unreadCount: 25},
            {id: 3, folderId: 3, title: 'hore', url: '1sye', unreadCount: 1}
        ]);

    }));


    it('should expose Feeds', inject(function (FeedResource) {
        FeedResource.add({url: 1});
        expect(controller.getFeeds()).toBe(FeedResource.getAll());
    }));


    it('should expose Folders', inject(function (FolderResource) {
        FolderResource.add({name: 1});
        expect(controller.getFolders()).toBe(FolderResource.getAll());
    }));


    it('should mark Folders read', inject(function ($controller) {
        var FeedResource = {
            markFolderRead: jasmine.createSpy('folder'),
            getByFolderId: function () {
                return [
                    {id: 3},
                    {id: 4}
                ];
            }
        };

        var ItemResource = {
            markFeedRead: jasmine.createSpy('feedfolder')
        };

        controller = $controller('NavigationController', {
            FeedResource: FeedResource,
            ItemResource: ItemResource
        });

        controller.markFolderRead(3);

        expect(FeedResource.markFolderRead).toHaveBeenCalledWith(3);
        expect(ItemResource.markFeedRead.callCount).toBe(2);
    }));


    it('should mark a feed read', inject(function ($controller) {
        var FeedResource = {
            markFeedRead: jasmine.createSpy('folder'),
        };

        var ItemResource = {
            markFeedRead: jasmine.createSpy('feedfolder')
        };

        controller = $controller('NavigationController', {
            FeedResource: FeedResource,
            ItemResource: ItemResource
        });

        controller.markFeedRead(3);

        expect(FeedResource.markFeedRead).toHaveBeenCalledWith(3);
        expect(ItemResource.markFeedRead).toHaveBeenCalledWith(3);
    }));


    it('should mark all read', inject(function ($controller) {
        var FeedResource = {
            markRead: jasmine.createSpy('folder'),
        };

        var ItemResource = {
            markRead: jasmine.createSpy('feedfolder')
        };

        controller = $controller('NavigationController', {
            FeedResource: FeedResource,
            ItemResource: ItemResource
        });

        controller.markRead();

        expect(FeedResource.markRead).toHaveBeenCalled();
        expect(ItemResource.markRead).toHaveBeenCalled();
    }));


    it('should mark all read', inject(function (SettingsResource, $controller) {
        var ctrl = $controller('NavigationController', {
            SettingsResource: SettingsResource,
        });

        SettingsResource.set('showAll', true);

        expect(ctrl.isShowAll()).toBe(true);
    }));


    it('should get all of folder', inject(function (FeedResource, $controller) {
        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
        });

        FeedResource.getByFolderId = jasmine.createSpy('getByFolderId');
        ctrl.getFeedsOfFolder(3);

        expect(FeedResource.getByFolderId).toHaveBeenCalledWith(3);
    }));


    it('should get the unreadcount', inject(function (FeedResource,
    $controller) {
        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
        });


        expect(ctrl.getUnreadCount()).toBe(71);
        expect(ctrl.getFeedUnreadCount(1)).toBe(45);
        expect(ctrl.getFolderUnreadCount(3)).toBe(46);
    }));


    it('should get the starred count', inject(function (ItemResource,
    $controller) {
        var ctrl = $controller('NavigationController', {
            ItemResource: ItemResource,
        });

        ItemResource.receive(99, 'starred');

        expect(ctrl.getStarredCount()).toBe(99);
    }));


    it('should toggle a folder', inject(function (FolderResource, $controller) {
        var ctrl = $controller('NavigationController', {
            FolderResource: FolderResource,
        });

        FolderResource.toggleOpen = jasmine.createSpy('open');

        ctrl.toggleFolder(3);

        expect(FolderResource.toggleOpen).toHaveBeenCalledWith(3);
    }));


    it('should check if a folder has feeds', inject(function (FeedResource,
        $controller) {
        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
        });

        expect(ctrl.hasFeeds(3)).toBe(true);
        expect(ctrl.hasFeeds(1)).toBe(false);
    }));


    it('should check if a subfeed is active', inject(function (FeedResource,
        FEED_TYPE, $controller) {
        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
            $route: {
                current: {
                    params: {
                        id: 3
                    },
                    $$route: {
                        type: FEED_TYPE.FEED
                    }
                }
            }
        });

        expect(ctrl.subFeedActive(3)).toBe(true);
    }));


    it('should check if a subscriptions is active', inject(function (
    FeedResource, FEED_TYPE, $controller) {
        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
            $route: {
                current: {
                    $$route: {
                        type: FEED_TYPE.SUBSCRIPTIONS
                    }
                }
            }
        });

        expect(ctrl.isSubscriptionsActive()).toBe(true);
    }));


    it('should check if a starred is active', inject(function (FeedResource,
        FEED_TYPE, $controller) {
        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
            $route: {
                current: {
                    $$route: {
                        type: FEED_TYPE.STARRED
                    }
                }
            }
        });

        expect(ctrl.isStarredActive()).toBe(true);
    }));



    it('should check if a feed is active', inject(function (FeedResource,
        FEED_TYPE, $controller) {
        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
            $route: {
                current: {
                    params: {
                        id: 3
                    },
                    $$route: {
                        type: FEED_TYPE.FEED
                    }
                }
            }
        });

        expect(ctrl.isFeedActive(3)).toBe(true);
    }));


    it('should check if a folder is active', inject(function (FeedResource,
        FEED_TYPE, $controller) {
        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
            $route: {
                current: {
                    params: {
                        id: 3
                    },
                    $$route: {
                        type: FEED_TYPE.FOLDER
                    }
                }
            }
        });

        expect(ctrl.isFolderActive(3)).toBe(true);
    }));


    it('should expose check if folder exists', inject(function (
    FolderResource) {
        expect(controller.folderNameExists('hi')).toBe(false);
        FolderResource.add({name: 'hi'});
        expect(controller.folderNameExists(' hi ')).toBe(true);
    }));

    it('should expose check if a feed url exists', inject(function (
    FeedResource) {
        expect(controller.feedUrlExists('hi')).toBe(false);
        FeedResource.add({url: 'http://hi'});
        expect(controller.feedUrlExists('hi ')).toBe(true);
        expect(controller.feedUrlExists('http://hi')).toBe(true);
    }));


    it('should create a feed with a folderId', inject(function ($controller) {
        var FeedResource = {
            create: jasmine.createSpy('create').andCallFake(
            function (url, folderId) {
                return {
                    then: function (callback) {
                        callback({feeds: [{
                            id: 3,
                            url: url,
                            folderId: folderId
                        }]});
                        return {
                            finally: function (callback) {
                                callback();
                            }
                        };
                    }
                };
            })
        };

        var location = {
            path: jasmine.createSpy('path')
        };

        var Publisher = {
            publishAll: jasmine.createSpy('publishAll')
        };

        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
            Publisher: Publisher,
            $location: location,
        });

        var feed = {
            url: 'test',
            existingFolder: {
                id: 3
            }
        };

        ctrl.createFeed(feed);

        expect(ctrl.newFolder).toBe(false);
        expect(FeedResource.create).toHaveBeenCalledWith('test', 3,
            undefined);
        expect(Publisher.publishAll).toHaveBeenCalledWith({feeds: [{
            id: 3,
            url: 'test',
            folderId: 3
        }]});
        expect(feed.url).toBe('');
        expect(feed.existingFolder.getsFeed).toBe(undefined);
        expect(ctrl.addingFeed).toBe(false);
        expect(feed.existingFolder.id).toBe(3);
        expect(location.path).toHaveBeenCalledWith('/items/feeds/3/');
    }));


    it('should create a feed with a foldername', inject(function ($controller) {

        var FeedResource = {
            create: jasmine.createSpy('create').andCallFake(
            function (url, folderId) {
                return {
                    then: function (callback) {
                        callback({feeds: [{
                            id: 2,
                            url: url,
                            folderId: folderId
                        }]});
                        return {
                            finally: function (callback) {
                                callback();
                            }
                        };
                    }
                };
            })
        };

        var FolderResource = {
            create: jasmine.createSpy('create').andCallFake(function (folder) {
                return {
                    then: function (callback) {
                        callback({
                            folders: [{
                                name: folder,
                                id: 19
                            }]
                        });
                    }
                };
            }),
            get: jasmine.createSpy('get').andCallFake(function (name) {
                return {
                    name: name,
                    id: 19
                };
            })
        };

        var Publisher = {
            publishAll: jasmine.createSpy('publishAll')
        };

        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
            Publisher: Publisher,
            FolderResource: FolderResource
        });

        var feed = {
            url: 'test',
            newFolder: 'john'
        };

        ctrl.createFeed(feed);

        expect(ctrl.newFolder).toBe(false);
        expect(FeedResource.create).toHaveBeenCalledWith('test', 19,
            undefined);
        expect(FolderResource.create).toHaveBeenCalledWith('john');
        expect(Publisher.publishAll).toHaveBeenCalledWith({
            folders: [{
                name: 'john',
                id: 19
            }]
        });
        expect(Publisher.publishAll).toHaveBeenCalledWith({feeds:[{
            id: 2,
            url: 'test',
            folderId: 19
        }]});
        expect(feed.url).toBe('');
        expect(feed.existingFolder.getsFeed).toBe(undefined);
        expect(feed.existingFolder.id).toBe(19);
        expect(ctrl.addingFeed).toBe(false);
    }));


    it('should create a folder', inject(function ($controller) {
        var FolderResource = {
            create: jasmine.createSpy('create').andCallFake(
            function (folder) {
                return {
                    then: function (callback) {
                        callback({
                            name: folder
                        });
                        return {
                            finally: function (callback) {
                                callback();
                            }
                        };
                    }
                };
            })
        };

        var Publisher = {
            publishAll: jasmine.createSpy('publishAll')
        };

        var ctrl = $controller('NavigationController', {
            Publisher: Publisher,
            FolderResource: FolderResource
        });

        var folder = {
            name: 'test',
        };

        ctrl.createFolder(folder);

        expect(FolderResource.create).toHaveBeenCalledWith('test');
        expect(Publisher.publishAll).toHaveBeenCalledWith({
            name: 'test'
        });
        expect(folder.name).toBe('');
        expect(ctrl.addingFolder).toBe(false);
    }));


    it('should move a feed', inject(function ($controller, FEED_TYPE,
    FeedResource) {
        FeedResource.move = jasmine.createSpy('move');

        var route = {
            reload: jasmine.createSpy('reload'),
            current: {
                $$route: {
                    type: FEED_TYPE.FOLDER
                },
                params: {
                    id: 2
                }
            }
        };

        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
            $route: route
        });

        ctrl.moveFeed(1, 4);

        expect(FeedResource.move).toHaveBeenCalledWith(1, 4);
        expect(route.reload).not.toHaveBeenCalled();
    }));


    it('should not move a feed if nothing changed', inject(function (
    $controller, FEED_TYPE, FeedResource) {
        FeedResource.move = jasmine.createSpy('move');

        var route = {
            reload: jasmine.createSpy('reload'),
            current: {
                $$route: {
                    type: FEED_TYPE.FOLDER
                },
                params: {
                    id: 2
                }
            }
        };

        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
            $route: route
        });

        ctrl.moveFeed(1, 3);

        expect(FeedResource.move).not.toHaveBeenCalled();
        expect(route.reload).not.toHaveBeenCalled();
    }));



    it('should reload if a feed is moved from active folder', inject(
    function ($controller, FEED_TYPE, FeedResource) {
        FeedResource.move = jasmine.createSpy('move');

        var route = {
            reload: jasmine.createSpy('reload'),
            current: {
                $$route: {
                    type: FEED_TYPE.FOLDER
                },
                params: {
                    id: 3
                }
            }
        };

        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
            $route: route
        });

        ctrl.moveFeed(3, 5);

        expect(route.reload).toHaveBeenCalled();
    }));


    it('should reload if a feed is moved into active folder', inject(
    function ($controller, FEED_TYPE, FeedResource) {
        FeedResource.move = jasmine.createSpy('move');

        var route = {
            reload: jasmine.createSpy('reload'),
            current: {
                $$route: {
                    type: FEED_TYPE.FOLDER
                },
                params: {
                    id: 5
                }
            }
        };

        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
            $route: route
        });

        ctrl.moveFeed(3, 5);

        expect(route.reload).toHaveBeenCalled();
    }));


    it('should rename a feed', inject(function ($controller, FeedResource) {
        FeedResource.rename = jasmine.createSpy('rename');

        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
        });

        var feed = {
            id: 3,
            title: 'test',
            editing: true
        };

        ctrl.renameFeed(feed);

        expect(FeedResource.rename).toHaveBeenCalledWith(3, 'test');
        expect(feed.editing).toBe(false);
    }));


    it('should rename a folder', inject(function ($controller, FolderResource) {
        FolderResource.rename = jasmine.createSpy('rename')
        .andCallFake(function () {
            return {
                then: function (success) {
                    success();
                    return {
                        finally: function (callback) {
                            callback();
                        }
                    };
                }
            };
        });

        var ctrl = $controller('NavigationController', {
            FolderResource: FolderResource,
        });

        var folder = {
            id: 3,
            name: 'test',
            renameError: 'nope',
            editing: true
        };

        ctrl.renameFolder(folder, 'abc');

        expect(FolderResource.rename).toHaveBeenCalledWith('test', 'abc');
        expect(folder.renameError).toBe('');
        expect(folder.editing).toBe(false);
    }));


    it('should handle rename folder error', inject(function ($controller,
    FolderResource) {
        FolderResource.rename = jasmine.createSpy('rename')
        .andCallFake(function () {
            return {
                then: function (success, error) {
                    error('no');
                    return {
                        finally: function (callback) {
                            callback();
                        }
                    };
                }
            };
        });

        var ctrl = $controller('NavigationController', {
            FolderResource: FolderResource,
        });

        var folder = {
            id: 3,
            name: 'test',
            renameError: 'nope',
            editing: true
        };

        ctrl.renameFolder(folder, 'abc');

        expect(FolderResource.rename).toHaveBeenCalledWith('test', 'abc');
        expect(folder.renameError).toBe('no');
        expect(folder.editing).toBe(true);
    }));


    it('should handle rename a folder if the name did not change',
    inject(function ($controller, FolderResource) {
        FolderResource.rename = jasmine.createSpy('rename');

        var ctrl = $controller('NavigationController', {
            FolderResource: FolderResource,
        });

        var folder = {
            id: 3,
            name: 'test',
            renameError: 'nope',
            editing: true
        };

        ctrl.renameFolder(folder, 'test');

        expect(FolderResource.rename).not.toHaveBeenCalled();
        expect(folder.renameError).toBe('');
        expect(folder.editing).toBe(false);
        expect(ctrl.renamingFolder).toBe(false);
    }));


    it('should reversibly delete a feed', inject(function (
    $controller, FeedResource, $q, $rootScope) {
        var deferred = $q.defer();
        FeedResource.reversiblyDelete = jasmine.createSpy('reversiblyDelete')
            .andReturn(deferred.promise);
        var route = {
            reload: jasmine.createSpy('reload')
        };

        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
            $route: route
        });

        var feed = {
            id: 3,
            url: 'yo',
            deleted: false
        };

        ctrl.reversiblyDeleteFeed(feed);

        // $q is triggered by $digest on $rootScope
        deferred.resolve();
        $rootScope.$digest();

        expect(FeedResource.reversiblyDelete).toHaveBeenCalledWith(3);
        expect(route.reload).toHaveBeenCalled();
    }));


    it('should undo delete a feed', inject(function (
    $controller, FeedResource, $q, $rootScope) {
        var deferred = $q.defer();
        FeedResource.undoDelete = jasmine.createSpy('undoDelete')
        .andReturn(deferred.promise);
        var route = {
            reload: jasmine.createSpy('reload')
        };

        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
            $route: route
        });

        var feed = {
            id: 3,
            deleted: true
        };

        ctrl.undoDeleteFeed(feed);

        // $q is triggered by $digest on $rootScope
        deferred.resolve();
        $rootScope.$digest();

        expect(FeedResource.undoDelete).toHaveBeenCalledWith(3);
        expect(route.reload).toHaveBeenCalled();
    }));


    it('should delete a feed', inject(function (
    $controller, FeedResource) {
        FeedResource.delete = jasmine.createSpy('delete');

        var ctrl = $controller('NavigationController', {
            FeedResource: FeedResource,
        });

        var feed = {
            id: 3,
            url: 'hi'
        };

        ctrl.deleteFeed(feed);

        expect(FeedResource.delete).toHaveBeenCalledWith('hi');
    }));


    it('should reversibly delete a folder', inject(function (
    $controller, FolderResource, FeedResource, $q, $rootScope) {
        var deferredFeed = $q.defer();
        var deferredFolder = $q.defer();

        FolderResource.reversiblyDelete = jasmine.createSpy('reversiblyDelete')
        .andReturn(deferredFolder.promise);
        FeedResource.reversiblyDeleteFolder =
            jasmine.createSpy('reversiblyDelete')
            .andReturn(deferredFolder.promise);

        var route = {
            reload: jasmine.createSpy('reload')
        };

        var ctrl = $controller('NavigationController', {
            FolderResource: FolderResource,
            FeedResource: FeedResource,
            $route: route
        });

        var folder = {
            id: 3,
            deleted: false,
            name: 'test'
        };

        ctrl.reversiblyDeleteFolder(folder);

        // $q is triggered by $digest on $rootScope
        deferredFeed.resolve();
        deferredFolder.resolve();
        $rootScope.$digest();

        expect(FolderResource.reversiblyDelete).toHaveBeenCalledWith('test');
        expect(FeedResource.reversiblyDeleteFolder).toHaveBeenCalledWith(3);
        expect(route.reload).toHaveBeenCalled();
    }));


    it('should undo delete a folder', inject(function (
    $controller, FolderResource, FeedResource, $q, $rootScope) {
        var deferredFeed = $q.defer();
        var deferredFolder = $q.defer();
        FolderResource.undoDelete = jasmine.createSpy('undoDelete')
        .andReturn(deferredFolder.promise);
        FeedResource.undoDeleteFolder = jasmine.createSpy('undoDelete')
        .andReturn(deferredFeed.promise);
        var route = {
            reload: jasmine.createSpy('reload')
        };

        var ctrl = $controller('NavigationController', {
            FolderResource: FolderResource,
            FeedResource: FeedResource,
            $route: route
        });

        var folder = {
            id: 3,
            deleted: true,
            name: 'test'
        };

        ctrl.undoDeleteFolder(folder);

        // $q is triggered by $digest on $rootScope
        deferredFeed.resolve();
        deferredFolder.resolve();
        $rootScope.$digest();

        expect(FolderResource.undoDelete).toHaveBeenCalledWith('test');
        expect(FeedResource.undoDeleteFolder).toHaveBeenCalledWith(3);
        expect(route.reload).toHaveBeenCalled();
    }));


    it('should delete a folder', inject(function (
    $controller, FolderResource, FeedResource) {
        FolderResource.delete = jasmine.createSpy('delete');
        FeedResource.deleteFolder = jasmine.createSpy('undoDelete');

        var ctrl = $controller('NavigationController', {
            FolderResource: FolderResource,
        });

        var folder = {
            id: 3,
            name: 'test'
        };

        ctrl.deleteFolder(folder);

        expect(FolderResource.delete).toHaveBeenCalledWith('test');
        expect(FeedResource.deleteFolder).toHaveBeenCalledWith(3);
    }));


});
