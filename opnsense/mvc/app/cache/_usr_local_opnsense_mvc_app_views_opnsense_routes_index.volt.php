

<script>

    $( document ).ready(function() {

        $("#grid-routes").UIBootgrid(
          { 'search':'/api/routes/routes/searchroute/',
            'get':'/api/routes/routes/getroute/',
            'set':'/api/routes/routes/setroute/',
            'add':'/api/routes/routes/addroute/',
            'del':'/api/routes/routes/delroute/',
            'toggle':'/api/routes/routes/toggleroute/',
            'options':{selection:false, multiSelect:false}
          }
        );
        $("#reconfigureAct").SimpleActionButton();
    });

</script>

<div class="content-box">
    <table id="grid-routes" class="table table-responsive" data-editDialog="DialogRoute" data-editAlert="routeChangeMessage">
        <thead>
            <tr>
                <th data-column-id="disabled" data-type="string" data-formatter="rowtoggle"><?= $lang->_('Disabled') ?></th>
                <th data-column-id="network" data-type="string" data-visible="true"><?= $lang->_('Network') ?></th>
                <th data-column-id="gateway" data-type="string" data-visible="true"><?= $lang->_('Gateway') ?></th>
                <th data-column-id="descr" data-type="string" data-visible="true"><?= $lang->_('Description') ?></th>
                <th data-column-id="uuid" data-type="string" data-identifier="true" data-visible="false"><?= $lang->_('ID') ?></th>
                <th data-column-id="commands" data-formatter="commands" data-sortable="false"><?= $lang->_('Commands') ?></th>
            </tr>
        </thead>
        <tbody>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="5"></td>
                <td>
                    <button data-action="add" type="button" class="btn btn-xs btn-primary"><span class="fa fa-fw fa-plus"></span></button>
                </td>
            </tr>
        </tfoot>
    </table>
    <div class="col-md-12">
        <div id="routeChangeMessage" class="alert alert-info" style="display: none" role="alert">
            <?= $lang->_('After changing settings, please remember to apply them with the button below') ?>
        </div>
        <?= $lang->_('Do not enter static routes for networks assigned on any interface of this firewall. Static routes are only used for networks reachable via a different router, and not reachable via your default gateway.') ?>
        <hr/>
        <button class="btn btn-primary" id="reconfigureAct"
                data-endpoint='/api/routes/routes/reconfigure'
                data-label="<?= $lang->_('Apply') ?>"
                data-error-title="<?= $lang->_('Error reconfiguring routes') ?>"
                type="button">
        </button>
        <br/><br/>
    </div>
</div>

<?= $this->partial('layout_partials/base_dialog', ['fields' => $formDialogEditRoute, 'id' => 'DialogRoute', 'label' => $lang->_('Edit route')]) ?>
