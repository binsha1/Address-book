
component persistent="true" entityname="contacts" table="address_book.contacts"  {
    property name="id" column="id" fieldtype="id" generator="identity" ormtype="integer";
    property name="title" column="title" ormtype="string";
    property name="first_name" column="first_name" ormtype="string";
    property name="last_name" column="last_name" ormtype="string";
    property name="gender" column="gender" ormtype="string";
    property name="dob" column="dob" ormtype="string";    
    property name="address" column="address" ormtype="string";
    property name="street_name" column="street_name" ormtype="string";
    property name="city" column="city" ormtype="string";
    property name="state" column="state" ormtype="string";
    property name="nation" column="nation" ormtype="string";
    property name="email_id" column="email_id" ormtype="string";
    property name="pincode" column="pincode" ormtype="string";
    property name="phone_number" column="phone_number" ormtype="string";
    property name="user_photo" column="user_photo" ormtype="string";
    property name="user_id" column="user_id" ormtype="integer";
}  