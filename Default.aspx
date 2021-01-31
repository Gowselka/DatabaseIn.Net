<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:SqlDataSource
          id="Suppliers"
          runat="server"
          DataSourceMode="DataReader"
          ConnectionString="<%$ ConnectionStrings:Lab 5 DatabaseConnectionString %>"
          SelectCommand="SELECT [Country], [CompanyName], [SupplierID], [ContactName] FROM [Suppliers]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Suppliers] WHERE [SupplierID] = @original_SupplierID AND [Country] = @original_Country AND [CompanyName] = @original_CompanyName AND [ContactName] = @original_ContactName" InsertCommand="INSERT INTO [Suppliers] ([Country], [CompanyName], [ContactName]) VALUES (@Country, @CompanyName, @ContactName)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Suppliers] SET [Country] = @Country, [CompanyName] = @CompanyName, [ContactName] = @ContactName WHERE [SupplierID] = @original_SupplierID AND [Country] = @original_Country AND [CompanyName] = @original_CompanyName AND [ContactName] = @original_ContactName">
          <DeleteParameters>
              <asp:Parameter Name="original_SupplierID" Type="Int32" />
              <asp:Parameter Name="original_Country" Type="String" />
              <asp:Parameter Name="original_CompanyName" Type="String" />
              <asp:Parameter Name="original_ContactName" Type="String" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="Country" Type="String" />
              <asp:Parameter Name="CompanyName" Type="String" />
              <asp:Parameter Name="ContactName" Type="String" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="Country" Type="String" />
              <asp:Parameter Name="CompanyName" Type="String" />
              <asp:Parameter Name="ContactName" Type="String" />
              <asp:Parameter Name="original_SupplierID" Type="Int32" />
              <asp:Parameter Name="original_Country" Type="String" />
              <asp:Parameter Name="original_CompanyName" Type="String" />
              <asp:Parameter Name="original_ContactName" Type="String" />
          </UpdateParameters>
      </asp:SqlDataSource>

        <asp:SqlDataSource
          id="Inventory"
          runat="server"
          DataSourceMode="DataReader"
          ConnectionString="<%$ ConnectionStrings:Lab 5 DatabaseConnectionString %>"
          SelectCommand="SELECT [InventoryID], [SupplierID], [Item], [UnitsInStock] FROM [Inventory]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Inventory] WHERE [InventoryID] = @original_InventoryID AND (([SupplierID] = @original_SupplierID) OR ([SupplierID] IS NULL AND @original_SupplierID IS NULL)) AND [Item] = @original_Item AND [UnitsInStock] = @original_UnitsInStock" InsertCommand="INSERT INTO [Inventory] ([SupplierID], [Item], [UnitsInStock]) VALUES (@SupplierID, @Item, @UnitsInStock)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Inventory] SET [SupplierID] = @SupplierID, [Item] = @Item, [UnitsInStock] = @UnitsInStock WHERE [InventoryID] = @original_InventoryID AND (([SupplierID] = @original_SupplierID) OR ([SupplierID] IS NULL AND @original_SupplierID IS NULL)) AND [Item] = @original_Item AND [UnitsInStock] = @original_UnitsInStock" OnSelecting="Inventory_Selecting">
            <DeleteParameters>
                <asp:Parameter Name="original_InventoryID" Type="Int32" />
                <asp:Parameter Name="original_SupplierID" Type="Int32" />
                <asp:Parameter Name="original_Item" Type="String" />
                <asp:Parameter Name="original_UnitsInStock" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SupplierID" Type="Int32" />
                <asp:Parameter Name="Item" Type="String" />
                <asp:Parameter Name="UnitsInStock" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="SupplierID" Type="Int32" />
                <asp:Parameter Name="Item" Type="String" />
                <asp:Parameter Name="UnitsInStock" Type="Int32" />
                <asp:Parameter Name="original_InventoryID" Type="Int32" />
                <asp:Parameter Name="original_SupplierID" Type="Int32" />
                <asp:Parameter Name="original_Item" Type="String" />
                <asp:Parameter Name="original_UnitsInStock" Type="Int32" />
            </UpdateParameters>
              
          </asp:SqlDataSource>

      <asp:GridView
          id="GridView1"
          runat="server"
          DataSourceID="Suppliers" AutoGenerateColumns="False" DataKeyNames="SupplierID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
          <Columns>
              <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
              <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
              <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" InsertVisible="False" ReadOnly="True" SortExpression="SupplierID" />
              <asp:BoundField DataField="ContactName" HeaderText="ContactName" SortExpression="ContactName" />
          </Columns>
      </asp:GridView>
        <br />
        </div>
        <div>
       <asp:GridView
          id="GridView2"
          runat="server"
          DataSourceID="Inventory" AutoGenerateColumns="False" DataKeyNames="SupplierID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
          <Columns>
              <asp:BoundField DataField="InventoryID" HeaderText="InventoryID" SortExpression="InventoryID" />
              <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" />
              <asp:BoundField DataField="UnitsInStock" HeaderText="Units In Stock" SortExpression="UnitsInStock" />
          </Columns>
      </asp:GridView> 

        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="GetQuantity" runat="server" Text="GetQuantity" OnClick="GetQuantity_Click" />

            <br />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox1" enableclientscript="false"
                ErrorMessage="Please Type Numbers Only" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            <br />
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox1" enableclientscript="false"
                ErrorMessage="Please enter a number between 0 &amp; 100" MaximumValue="100" MinimumValue="0" Type="Integer"></asp:RangeValidator>

        <br />
        <br />

        <asp:SqlDataSource
          id="Reorder"
          runat="server"
          DataSourceMode="DataReader"
          ConnectionString="<%$ ConnectionStrings:Lab 5 DatabaseConnectionString %>"
          SelectCommand="SELECT Inventory.Item, Inventory.UnitsInStock, Suppliers.CompanyName, Inventory.SupplierID AS Expr1 FROM Inventory INNER JOIN Suppliers ON Inventory.SupplierID = Suppliers.SupplierID WHERE (Inventory.UnitsInStock &lt;= @quantity)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Inventory] WHERE [InventoryID] = @original_InventoryID AND (([SupplierID] = @original_SupplierID) OR ([SupplierID] IS NULL AND @original_SupplierID IS NULL)) AND [Item] = @original_Item AND [UnitsInStock] = @original_UnitsInStock" InsertCommand="INSERT INTO [Inventory] ([SupplierID], [Item], [UnitsInStock]) VALUES (@SupplierID, @Item, @UnitsInStock)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Inventory] SET [SupplierID] = @SupplierID, [Item] = @Item, [UnitsInStock] = @UnitsInStock WHERE [InventoryID] = @original_InventoryID AND (([SupplierID] = @original_SupplierID) OR ([SupplierID] IS NULL AND @original_SupplierID IS NULL)) AND [Item] = @original_Item AND [UnitsInStock] = @original_UnitsInStock" OnSelecting="Inventory_Selecting">
            <DeleteParameters>
                <asp:Parameter Name="original_InventoryID" Type="Int32" />
                <asp:Parameter Name="original_SupplierID" Type="Int32" />
                <asp:Parameter Name="original_Item" Type="String" />
                <asp:Parameter Name="original_UnitsInStock" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="SupplierID" Type="Int32" />
                <asp:Parameter Name="Item" Type="String" />
                <asp:Parameter Name="UnitsInStock" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="0" Name="quantity" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="SupplierID" Type="Int32" />
                <asp:Parameter Name="Item" Type="String" />
                <asp:Parameter Name="UnitsInStock" Type="Int32" />
                <asp:Parameter Name="original_InventoryID" Type="Int32" />
                <asp:Parameter Name="original_SupplierID" Type="Int32" />
                <asp:Parameter Name="original_Item" Type="String" />
                <asp:Parameter Name="original_UnitsInStock" Type="Int32" />
            </UpdateParameters>
              
          </asp:SqlDataSource>
          <asp:GridView
          id="GridView3"
          runat="server"
          DataSourceID="Reorder" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
          <Columns>
              <asp:BoundField DataField="Item" HeaderText="Item" SortExpression="Item" /> 
              <asp:BoundField DataField="UnitsInStock" HeaderText="UnitsInStock" SortExpression="UnitsInStock" />
              <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" />
              <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
          </Columns>
      </asp:GridView> 

            <br />
   

      </div>

    </form>
</body>
</html>
