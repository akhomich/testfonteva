global class PackageScripts{


    /**
     * Execute the installation scripts for the Customer Implementation
     */
    global static void install() {
        new PackageScripts.Install().run();
    }


    global class Install implements Framework.Scriptable {
        global void run() {
            Framework.Log.push(PackageScripts.Install.class.getName(),'run');

            new AppConfig().run();
            new Register().run();
            new Rollups().run();

            Framework.Log.pop();
        }
    }


    global class AppConfig implements Framework.Scriptable {
        global void run() {
            Framework.Log.push(PackageScripts.AppConfig.class.getName(),'run');

            /**
             *
             * Do Org Config
             *
             */

            Framework.Log.pop();
        }
    }


    global class Register implements Framework.Scriptable {
        global void run() {

            //------------- Begin: Registering App-------------------//

            Framework.RegisteredApp ev = new Framework.RegisteredApp();
            ev.namespace = PackageUtils.namespace;
            ev.name = 'CUSIMP';
            ev.description = 'My Custom implementation';
            ev.owner = 'CUSIMP';
            ev.isManaged = true;
            ev.isEnabled = true;
            ev.installClass = PackageScripts.Install.class.getName();
            Framework.Config.push(ev);


            //------------- Begin: Registering objects (Alphabetical Order)-------------------//

            Framework.RegisteredObject[] regObjects = new List<Framework.RegisteredObject>();

            // Attendee__c Sample
            // ---------------------------------------------------------------------
            Framework.RegisteredObject att = new Framework.RegisteredObject();
            att.sObjectName = Framework.SchemaService.getDescribe(Contact.SObjectType).getName();
            att.apexClass = MyTriggerContacts.class.getName();
            att.namespace = PackageUtils.namespace;
            att.isEnabled = true;
            att.isStandard = false;
            att.triggersEnabled = true;
            att.soqlLimit = String.valueOf(2000);
            att.soqlOrderBy = SObjectType.Contact.fields.Name.getName() + ' ASC';
            regObjects.add(att);



            Framework.Config.push(regObjects);


            //------------- Begin: Routing Rules creation (Alphabetical Order)--------------------//
            Framework.RoutingRule[] rules = new List<Framework.RoutingRule>();

            // OrderApi__Assignment__c ** Routing Rule Extension ** Sample
            // ---------------------------------------------------------------------
            Framework.RoutingRule accPermission = new Framework.RoutingRule();
            accPermission.apexClass = MyTriggerContacts.class.getName();
            accPermission.namespace = PackageUtils.namespace;
            accPermission.isEnabled = true;
            accPermission.sObjectName = SObjectType.Contact.getName();
            accPermission.executionOrder = 0;
            rules.add(accPermission);


            Framework.Config.push(rules);

        }
    }

    global class Rollups implements Framework.Scriptable {
        global void run() {
            Framework.Log.push(PackageScripts.class.getName(),'.Scripts.createRollups');
            Framework.RollupSummaryField[] rsfs = new List<Framework.RollupSummaryField>();

            /**
             * Event__c.Attendees__c (# of Registered Attendees) (Count) Sample
             */
            /** Framework.RollupSummaryField rsf = new Framework.RollupSummaryField();
             *  rsf.namespace = PackageUtils.namespace;
             *  rsf.childField = SObjectType.Attendee__c.fields.Id.getName();
             *  rsf.childSObject = SObjectType.Attendee__c.getName();
             *  String sFilter;
             *  sFilter = SObjectType.Attendee__c.fields.Status__c.getName() + ' = \'Registered\' ';
             *  sFilter += ' OR ' + SObjectType.Attendee__c.fields.Status__c.getName() + '= \'Checked In\' ';
             *  sFilter += ' OR ' + SObjectType.Attendee__c.fields.Status__c.getName() + '= \'Transferred\' ';
             *  sFilter += ' OR ' + SObjectType.Attendee__c.fields.Status__c.getName() + '= \'Invited\' ';
             *  rsf.filter = sFilter;
             *  rsf.operation = Framework.RollupSummaryField.Operation.Count.name();
             *  rsf.parentField = Framework.SchemaService.getDescribe(Event__c.Attendees__c).getName();
             *  rsf.parentSObject = Framework.SchemaService.getDescribe(Event__c.SObjectType).getName();
             *  rsf.relationshipField = Framework.SchemaService.getDescribe(Attendee__c.Event__c).getName();
             *  rsf.isEnabled = true;
             *  rsfs.add(rsf);
             */

            Framework.Config.push(rsfs);
            Framework.Log.pop();
        }
    }

}