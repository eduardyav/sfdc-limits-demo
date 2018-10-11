@isTest
public class DemoLimitsViolation
{  
    @isTest
	public static void dmlViolation()
    {
        for (Integer i=0; i < 151; i++)
        {
            insert new Contact(LastName = 'test' + i);
        }
    }
    
    @isTest
	public static void soqlViolation()
    {
        insert new Contact(LastName = 'test');
        for (Integer i=0; i < 101; i++)
        {
            Contact cnt = null;
            cnt = [SELECT Id, Name FROM Contact WHERE LastName LIKE '%test%' LIMIT 1];
        }
    }
}