global with sharing class MyTriggerContacts extends Framework.Domain {

    public MyTriggerContacts(List<Contact> sObjectList) {
        super(sObjectList);
    }

    global class Constructor implements Framework.Domain.DomainConstructor {
        global Framework.Domain construct(List<SObject> sObjectList) {
            return new MyTriggerContacts(sObjectList);
        }
    }

    // Runs for every trigger context
    public override void applyDefaults() {
        Framework.Log.push(MyTriggerContacts.class.getName(),'applyDefaults');

        // Call Service class method to apply defaults
        // context records are available as an SObject[]
        // and the variable is `records`

        //e.g. ContactService.applyDefaults((Contact[]) records);

        Framework.Log.pop();
    }

    public override void beforeInsert() {
        Framework.Log.push(MyTriggerContacts.class.getName(),'beforeInsert');

        for (Contact c : (Contact[])records) {
            c.LastName = c.LastName + ' smSSSSSth!';
        }

        Framework.Log.pop();
    }

    public override void beforeUpdate(Map<Id,SObject> oldMap) {
        Framework.Log.push(MyTriggerContacts.class.getName(),'beforeUpdate');

        // Call Service class method for before update
        // context records are available as an SObject[]
        // and the variable is `records`

        Framework.Log.pop();
    }

    public override void afterInsert() {
        Framework.Log.push(MyTriggerContacts.class.getName(),'afterInsert');

        // Call Service class method for after insert
        // context records are available as an SObject[]
        // and the variable is `records`

        Framework.Log.pop();
    }

    public override void afterUpdate(Map<Id,SObject> oldMap) {
        Framework.Log.push(MyTriggerContacts.class.getName(),'afterUpdate');

        // Call Service class method for after update
        // context records are available as an SObject[]
        // and the variable is `records`

        Framework.Log.pop();
    }


    public override void afterDelete() {
        Framework.Log.push(MyTriggerContacts.class.getName(),'afterDelete');

        // Call Service class method for after delete
        // context records are available as an SObject[]
        // and the variable is `records`

        Framework.Log.pop();
    }

    // Call this to implement custom validation
    // for before context
    public override void validate() {
        Framework.Log.push(MyTriggerContacts.class.getName(),'validate');

        // Call Service class method for validation
        // context records are available as an SObject[]
        // and the variable is `records`

        Framework.Log.pop();
    }

    // Call this to implement custom validation
    // for after context
    public override void validate(Map<Id,SObject> oldMap) {
        Framework.Log.push(MyTriggerContacts.class.getName(),'validate');

        // Call Service class method for validation
        // context records are available as an SObject[]
        // and the variable is `records`

        Framework.Log.pop();
    }
}