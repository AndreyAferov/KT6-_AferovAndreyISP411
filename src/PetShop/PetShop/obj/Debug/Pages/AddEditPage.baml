   M S B A M L   `   `   `  ����B  >PetShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:PetShop.PagesPetShop.Pages  5          PetShop.Pages.AddEditPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -localclr-namespace:PetShop.Pages     5        N� Title$  AddEditPage��5	       N� 
Background
 �����$	��450��5      $	��800��5      .��5      �  � RowDefinitions 5   
   �� 5      6   �� 5      6   �� 5      6   �� 5      6   �� 5      6   �� 5      6   �� 5      6    � ColumnDefinitions 5   
   �� 5      6!   �� 5      6!   �� 5      6!   �� 5      6!   .+�5   
   �� -   5         ��Name$ IdLabel��5      $��Id��6   $��0��6.   $��Center=�6;   6Z   �� 5    
   $��Наименование��6   $��1��6'   $��Center=�64   6S   �� 5!   
   $��Категория��6   $��2��6$   $��Center=�61   6P   �� 5"   
   $,��&Количество на складе��6   $��3��6/   $��Center=�6<   6[   �� 5#   
   $'��!Единица измерения��6   $��4��6,   $��Center=�69   6X   �� 5$   
   $��Поставщик��6   $��5��6$   $��Center=�61   6P   �� 5&   
   $,��&Стоимость за единицу��6   $��2��6/   $��0��6?   $��Center=�6L   6k   �� 5'   
   $��Изобраение��6   $��2��6%   $��1��65   $��Center=�6B   6a   �� 5(   
   $)��#Подробное описание��6   $��2��6-   $��3��6=   $��Center=�6J   6i   �� 5+   
   -   5         ��Name$ ProductImage��5+      $��10q�6&   $��1��5,      $��3��6!   $��2��61   $	��Top=�5-   7   $
��Left=�6O   ��5.      �� 5/       �� Path$ ProductPhote�6    �� TargetNullValue 50      �� 51       �� 	UriSource$ /Resources/picture.png?�6&   53      55      �� 56   
   -   5        	 ��Name$	 	IdTextBox��56   $   {�.  $��1��67   $��0��6G   $	��Top=�6T   $
��Left=�6l   6�   �� 57   
   -   5        $	 NameTextBox��57      $��1��6'   $��1��67   $	��Top=�6D   $
��Left=�6\   6y   �� 58   
   -   5        
 ��Name$
 CategoryCombo��58       �� DisplayMemberPath$ 	Category1��6*   $��1��6H   $��2��6X   $	��Top=�6e   $
��Left=�6}   6�   �� 59   
   -   5        $	 CountTextBox��59      $��1��6(   $��3��68   $	��Top=�6E   $
��Left=�6]   6z   �� 5:   
   -   5        $	 UnitTextBox��5:      $��1��6'   $��4��67   $	��Top=�6D   $
��Left=�6\   6y   �� 5;   
   -   5        $	 SupplierTextBox��5;      $��1��6+   $��5��6;   $	��Top=�6H   $
��Left=�6`   6}   �� 5<   
   -	   5        $	 CostTextBox��5<      $��3��6'   $��0��67   $	��Top=�6D   $
��Left=�6\   6y   �� 5=   
   -
   5        $	 DescriptionTextBox��5=      " �� VerticalScrollBarVisibility$ Visible=�6/    �� TextWrapping$
 Wrap=�6U    �� AcceptsReturn . $��3��6~   $��3��6�   $��2��6�   $	��Top=�6�   $
��Left=�6�   $	��118��6�   $	��190��6�   6�   �� 5?   
   -   5         ��Name$ 
BackButton��5?      $��
Назад��6%   $��6��6N   6]   �� 5@   
   -   5        $ 	AddButton��5@      $��Добавить��6$   $��3��6P   $��6��6`   6o   5B      5C      