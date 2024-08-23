﻿#pragma checksum "..\..\SecondWindow.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "00D552AC1735B71FE4C56BFAEB3A712B15EAA44C4FD0329B4E87995F33CB1FAC"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using Microsoft.Windows.Themes;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;
using UI;


namespace UI {
    
    
    /// <summary>
    /// SecondWindow
    /// </summary>
    public partial class SecondWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 10 "..\..\SecondWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label lblDetailName;
        
        #line default
        #line hidden
        
        
        #line 11 "..\..\SecondWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label lblDateGenerated;
        
        #line default
        #line hidden
        
        
        #line 12 "..\..\SecondWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label lblTimeGenerated;
        
        #line default
        #line hidden
        
        
        #line 14 "..\..\SecondWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnBackToMain;
        
        #line default
        #line hidden
        
        
        #line 15 "..\..\SecondWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox txtSearchDetail;
        
        #line default
        #line hidden
        
        
        #line 16 "..\..\SecondWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnUpload;
        
        #line default
        #line hidden
        
        
        #line 19 "..\..\SecondWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid dgSpreadsheets;
        
        #line default
        #line hidden
        
        
        #line 22 "..\..\SecondWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnSearchDetail;
        
        #line default
        #line hidden
        
        
        #line 23 "..\..\SecondWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnShowAll;
        
        #line default
        #line hidden
        
        
        #line 25 "..\..\SecondWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label lblMessage;
        
        #line default
        #line hidden
        
        
        #line 26 "..\..\SecondWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnDownload;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/UI;component/secondwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\SecondWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.lblDetailName = ((System.Windows.Controls.Label)(target));
            return;
            case 2:
            this.lblDateGenerated = ((System.Windows.Controls.Label)(target));
            return;
            case 3:
            this.lblTimeGenerated = ((System.Windows.Controls.Label)(target));
            return;
            case 4:
            this.btnBackToMain = ((System.Windows.Controls.Button)(target));
            
            #line 14 "..\..\SecondWindow.xaml"
            this.btnBackToMain.Click += new System.Windows.RoutedEventHandler(this.btnBackToMain_Click);
            
            #line default
            #line hidden
            return;
            case 5:
            this.txtSearchDetail = ((System.Windows.Controls.TextBox)(target));
            return;
            case 6:
            this.btnUpload = ((System.Windows.Controls.Button)(target));
            
            #line 16 "..\..\SecondWindow.xaml"
            this.btnUpload.Click += new System.Windows.RoutedEventHandler(this.btnUpload_Click);
            
            #line default
            #line hidden
            return;
            case 7:
            this.dgSpreadsheets = ((System.Windows.Controls.DataGrid)(target));
            return;
            case 8:
            this.btnSearchDetail = ((System.Windows.Controls.Button)(target));
            
            #line 22 "..\..\SecondWindow.xaml"
            this.btnSearchDetail.Click += new System.Windows.RoutedEventHandler(this.btnSearchDetail_Click);
            
            #line default
            #line hidden
            return;
            case 9:
            this.btnShowAll = ((System.Windows.Controls.Button)(target));
            
            #line 23 "..\..\SecondWindow.xaml"
            this.btnShowAll.Click += new System.Windows.RoutedEventHandler(this.btnShowAll_Click);
            
            #line default
            #line hidden
            return;
            case 10:
            this.lblMessage = ((System.Windows.Controls.Label)(target));
            return;
            case 11:
            this.btnDownload = ((System.Windows.Controls.Button)(target));
            
            #line 26 "..\..\SecondWindow.xaml"
            this.btnDownload.Click += new System.Windows.RoutedEventHandler(this.btnDownload_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

