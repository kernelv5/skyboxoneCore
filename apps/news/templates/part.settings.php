<div id="app-settings-header">
<button name="app settings"
    class="settings-button"
    data-apps-slide-toggle="#app-settings-content"></button>
</div>

<div id="app-settings-content">
    <h3><?php p($l->t('Settings')); ?></h3>

    <p ng-click="Settings.toggleSetting('compact')">
        <label for="compact">
            <input type="checkbox" ng-checked="Settings.getSetting('compact')" name="compact">
            <?php p($l->t('Compact view')); ?>
        </label>
    </p>

    <p ng-click="Settings.toggleSetting('showAll')">
        <label for="showAll">
            <input type="checkbox" ng-checked="Settings.getSetting('showAll')" name="showAll">
            <?php p($l->t('Show unread articles')); ?>
        </label>
    </p>

    <p ng-click="Settings.toggleSetting('oldestFirst')">
        <label for="oldestFirst">
            <input type="checkbox" ng-checked="Settings.getSetting('oldestFirst')" name="oldestFirst">
            <?php p($l->t('Order by oldest first')); ?>
        </label>
    </p>

    <p ng-click="Settings.toggleSetting('preventReadOnScroll')">
        <label for="preventReadOnScroll">
            <input type="checkbox" ng-checked="Settings.getSetting('preventReadOnScroll')" name="preventReadOnScroll">
            <?php p($l->t('Disable mark read during scrolling')); ?>
        </label>
    </p>


    <div class="import-export">
        <h3><?php p($l->t('Subscriptions (OPML)')); ?></h3>

        <input type="file"
            id="opml-upload"
            name="import"
            news-read-file="Settings.importOPML($fileContent)"/>

        <button title="<?php p($l->t('Import')); ?>"
            class="icon-upload svg button-icon-label"
            news-trigger-click="#opml-upload"
            ng-class="{'entry-loading': Settings.isOPMLImporting}"
            ng-disabled="Settings.isOPMLImporting || Settings.isArticlesImporting">
            <?php p($l->t('Import')); ?>
        </button>

        <a title="<?php p($l->t('Export')); ?>"
            class="button icon-download svg button-icon-label"
            href="<?php p(\OCP\Util::linkToRoute('news.export.opml')); ?>"
            target="_blank"
            ng-hide="App.isFirstRun()">
            <?php p($l->t('Export')); ?>
        </a>

        <button
            class="icon-download svg button-icon-label"
            title="<?php p($l->t('Export')); ?>"
            ng-show="App.isFirstRun()"
            disabled>
            <?php p($l->t('Export')); ?>
        </button>

        <p class="error" ng-show="Settings.opmlImportError">
            <?php p($l->t('Error when importing: file does not contain valid OPML')); ?>
        </p>


        <h3><?php p($l->t('Unread/Starred Articles')); ?></h3>

        <input
            type="file"
            id="article-upload"
            name="importarticle"
            news-read-file="Settings.importArticles($fileContent)"/>

        <button title="<?php p($l->t('Import')); ?>"
            class="icon-upload svg button-icon-label"
            ng-class="{'entry-loading': Settings.isArticlesImporting}"
            ng-disabled="Settings.isOPMLImporting || Settings.isArticlesImporting"
            news-trigger-click="#article-upload">
            <?php p($l->t('Import')); ?>
        </button>

        <a title="<?php p($l->t('Export')); ?>" class="button icon-download svg button-icon-label"
            href="<?php p(\OCP\Util::linkToRoute('news.export.articles')); ?>"
            target="_blank"
            ng-hide="App.isFirstRun()">
            <?php p($l->t('Export')); ?>
        </a>
        <button
            class="icon-download svg button-icon-label"
            title="<?php p($l->t('Export')); ?>"
            ng-show="App.isFirstRun()"
            disabled>
            <?php p($l->t('Export')); ?>
        </button>

        <p class="error" ng-show="Settings.articleImportError">
            <?php p($l->t('Error when importing: file does not contain valid JSON')); ?>
        </p>
    </div>
</div>