/**
 * ownCloud - News
 *
 * This file is licensed under the Affero General Public License version 3 or
 * later. See the COPYING file.
 *
 * @author Bernhard Posselt <dev@bernhard-posselt.com>
 * @copyright Bernhard Posselt 2014
 */
describe('SettingsController', function () {
    'use strict';

    var route;

    beforeEach(module('News', function ($provide) {
        $provide.value('BASE_URL', 'base');
        $provide.value('ITEM_BATCH_SIZE', 3);
    }));

    beforeEach(function () {
        route = {
            reload: jasmine.createSpy('Route')
        };
    });

    it('should set values', inject(function ($controller) {
        var SettingsResource = {
            set: jasmine.createSpy('SettingsResource'),
            get: function (key) { return key; }
        };

        var ctrl = $controller('SettingsController', {
            SettingsResource: SettingsResource,
            $route: route
        });

        ctrl.toggleSetting(3);

        expect(SettingsResource.set).toHaveBeenCalledWith(3, false);
    }));


    it('should reload page if set needed', inject(function ($controller) {
        var SettingsResource = {
            set: jasmine.createSpy('SettingsResource'),
            get: function (key) { return key; }
        };

        var ctrl = $controller('SettingsController', {
            SettingsResource: SettingsResource,
            $route: route
        });

        ctrl.toggleSetting('showAll');
        ctrl.toggleSetting('oldestFirst');

        expect(SettingsResource.set).toHaveBeenCalledWith('showAll', false);
        expect(route.reload).toHaveBeenCalled();
        expect(route.reload.callCount).toBe(2);
    }));


    it('should import articles', inject(function ($controller, ItemResource,
    Publisher) {
        var data = 1;
        ItemResource.importArticles = jasmine.createSpy('importArticles')
        .andCallFake(function () {
            return {
                success: function (callback) {
                    callback(data);
                    return {
                        finally: function (finalCallback) {
                            finalCallback();
                        }
                    };
                }
            };
        });
        Publisher.publishAll = jasmine.createSpy('publishAll');

        var ctrl = $controller('SettingsController', {
            ItemResource: ItemResource,
            Publisher: Publisher
        });

        var content = '{"test":1}';

        ctrl.importArticles(content);

        expect(ItemResource.importArticles)
            .toHaveBeenCalledWith(JSON.parse(content));
        expect(Publisher.publishAll).toHaveBeenCalledWith(data);
        expect(ctrl.isArticlesImporting).toBe(false);
        expect(ctrl.articleImportError).toBe(false);
    }));


    it('should display import articles error', inject(function ($controller) {
        var ctrl = $controller('SettingsController');

        var content = '{"test:1}';

        ctrl.importArticles(content);

        expect(ctrl.isArticlesImporting).toBe(false);
        expect(ctrl.articleImportError).toBe(true);
    }));



    it('should import opml', inject(function ($controller, OPMLImporter,
    OPMLParser) {
        var queue = 4;

        OPMLParser.parse = jasmine.createSpy('parse').andReturn(2);

        OPMLImporter.importFolders = jasmine.createSpy('importFolders')
        .andReturn({
            then: function (callback) {
                callback(queue, 5);
                return {
                    finally: function (finalCallback) {
                        finalCallback();
                    }
                };
            }
        });

        OPMLImporter.importFeedQueue = jasmine.createSpy('importFeedQueue');

        var ctrl = $controller('SettingsController', {
            OPMLImporter: OPMLImporter,
            OPMLParser: OPMLParser
        });

        var content = '{"test":1}';

        ctrl.importOPML(content);

        expect(OPMLParser.parse).toHaveBeenCalledWith(content);
        expect(OPMLImporter.importFolders).toHaveBeenCalledWith(2);
        expect(OPMLImporter.importFeedQueue).toHaveBeenCalledWith(4, 5);
        expect(ctrl.isOPMLImporting).toBe(false);
        expect(ctrl.opmlImportError).toBe(false);
    }));


    it('should display import opml error', inject(function (
    $controller, OPMLParser) {
        OPMLParser.parse = jasmine.createSpy('parse').andCallFake(function () {
            throw 1;
        });

        var ctrl = $controller('SettingsController', {
            OPMLParser: OPMLParser
        });

        ctrl.importOPML('content');

        expect(ctrl.isOPMLImporting).toBe(false);
        expect(ctrl.opmlImportError).toBe(true);
    }));
});