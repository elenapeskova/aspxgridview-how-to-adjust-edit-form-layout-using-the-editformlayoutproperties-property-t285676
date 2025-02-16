﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                KeyFieldName="ProductID" OnRowInserting="ASPxGridView1_RowInserting" 
                OnRowUpdating="ASPxGridView1_RowUpdating" OnCustomErrorText="ASPxGridView1_CustomErrorText"
                OnCustomButtonCallback="ASPxGridView1_CustomButtonCallback">
                <Columns>
                    <dx:GridViewCommandColumn VisibleIndex="0">
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton ID="CustomButtonNew" Text="New" />
                            <dx:GridViewCommandColumnCustomButton ID="CustomButtonEdit" Text="Edit" />
                        </CustomButtons>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="true" VisibleIndex="1" />
                    <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="2" />
                    <dx:GridViewDataTextColumn FieldName="CategoryID" VisibleIndex="3" />
                    <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="4" />
                    <dx:GridViewDataCheckColumn FieldName="Discontinued" VisibleIndex="5" />
                </Columns>
                <EditFormLayoutProperties ColumnCount="5" RequiredMarkDisplayMode="All">
                    <Items>
                        <dx:GridViewColumnLayoutItem ColumnName="ProductID" Name="ProductID" RequiredMarkDisplayMode="Required" RowSpan="2" />
                        <dx:GridViewColumnLayoutItem ColumnName="ProductName" RequiredMarkDisplayMode="Optional" ColumnSpan="2" />
                        <dx:GridViewColumnLayoutItem ColumnName="CategoryID" ColumnSpan="2" RequiredMarkDisplayMode="Auto">
                            <Template>
                                <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="SqlDataSource2" ValueType="System.Int32"
                                    Value='<%# Eval("CategoryID") %>' TextField="CategoryName" ValueField="CategoryID" />
                            </Template>
                        </dx:GridViewColumnLayoutItem>
                        <dx:GridViewColumnLayoutItem ColumnName="UnitPrice" ColumnSpan="3" />
                        <dx:GridViewColumnLayoutItem ColumnName="Discontinued" RequiredMarkDisplayMode="Hidden" />
                        <dx:EditModeCommandLayoutItem ColumnSpan="5" HorizontalAlign="Right" RequiredMarkDisplayMode="Hidden" />
                    </Items>
                </EditFormLayoutProperties>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>"
                SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice], [Discontinued] FROM [Products]"
                InsertCommand="INSERT INTO [Products] ([ProductName], [CategoryID], [UnitPrice], [Discontinued]) VALUES (@ProductName, @CategoryID, @UnitPrice, @Discontinued)"
                UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [CategoryID] = @CategoryID, [UnitPrice] = @UnitPrice, [Discontinued] = @Discontinued WHERE [ProductID] = @ProductID">
                <InsertParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="Discontinued" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ProductName" Type="String" />
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                    <asp:Parameter Name="UnitPrice" Type="Decimal" />
                    <asp:Parameter Name="Discontinued" Type="Boolean" />
                    <asp:Parameter Name="ProductID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnStr %>" SelectCommand="SELECT * FROM [Categories]" />
        </div>
    </form>
</body>
</html>
