   M S B A M L   `   `   `  ����B  >PetShop, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:PetShop.PagesPetShop.Pages  5          PetShop.Pages.ViewPage   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -localclr-namespace:PetShop.Pages     5        N� Title$  ViewPage��5	       N� 
Background
 �����.��5      �  � RowDefinitions 5   
   �� 5      $��50 �6   6*   �� 5      $��70 �6   6*   �� 5      $��* �6   6)   �� 5      $��50 �6   6*   .+�5   
   �� -   5         ��Name$ FIOLabel��5      $��Right=�6"   $��0,0,10,0q�5   	   $��ФИО��6   $��Center=�5   	   $��0��6$   63   �� 5   
   -   5        $ CountOfLabel��5      $
��Left=�6&   $��10,0,0,0q�5      $��15/30��6   $��Center=�5      $��0��6(   67   � 5   
   $��1��6   .+�5      �� -   5         ��Name$ SearchTextBox��5      $	��150��6-   $
��Left=�5      $��10,10,10,10q�6*   5      	� 5      -   5         	�Name$ SortRadioButton��5      $!��По возрастанию��5      $��Center=�6,   $
��left=�5       $��	200,0,0,0q�5!      5"      	� 5#      -   5        $ SortDownRadioButton��5#      $��По убыванию��5$      $��Center=�6   $
��left=�5%      $��	350,0,0,0q�5&      5'   
   �� 5(      -   5         ��Name$ ManufacturerComboBox��5(      $	��160��5)      $��30��6   $
��Left=�5*      $��Center=�5+      $��	470,0,0,0q�5,       �� DisplayMemberPath$
 Name��6#   6>   5-      �� 5/   
   -   5         ��Name$ ProductListView��5/      $��Center=�6,   $��Center=�50      $��10q�51      $��2��6   ��52      �� 53      	 �� 
TargetType"	 ��6   
 �� Triggers
 54      �� 55       �� Binding 6&   �� *ProductQuantityInStock+ �� Value 06Q   .a�56      ��  �� Property � �� �� Value
 �����6;   57      59      ��5<      �� 5=      .R�5>      �  � ColumnDefinitions 5?      �� 5@      $	��150 �6/   6=   �� 5A      $	��400 �6/   6=   �� 5B      $	��150 �6/   6=   �� 5C      $	��150 �6/   6=   .+�5E      �� $��0��6    $��10q�5F      ��5G      �� 5H   "    �� Path$ ProductPhote�6*    �� TargetNullValue 5I   &   �� 5J   *    �� 	UriSource$ /Resources/picture.png?�66   6[   5L   #   5N      �� 5O      $��1��6%   $��Center=�5P      $
��Left=�5Q      .+�5R      �� $
��Bold"�5S   8   ��5R   (   �� *ProductName.Name+ �� StringFormat$0 *Наименование товара: {0}��5S   L   �� 5T      $
��Wrap=�5U   0   ��5T   (   �� *ProductDiscription+$( "Описание товара: {0}��5U   F   �� 5V      ��6(   �� *Manufacture.Name+$% Производитель: {0}��5W   1   �� 5X      ��6(   �� *ProductCost+$ Цена: {0}��5Y   (   5Z      �� 5[      $��2��6$   $��center=�5]      $��Center=�6/   ��5[   4   �� *ProductQuantityInStock+$+ %Наличие на складе: {0}��5]   N   5^      5`      5b      �� 5c   
   -   5         ��Name$ 	BackButon��5c      $��
Назад��6$   $��3��5d      6-   5e      5f      