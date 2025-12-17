from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.tabbedpanel import TabbedPanel, TabbedPanelItem
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.uix.textinput import TextInput
from kivy.uix.image import Image
from kivy.uix.gridlayout import GridLayout
import os

class IcraTakipTab(BoxLayout):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.orientation = 'vertical'
        self.padding = 10
        self.spacing = 10
        self.init_ui()
        
    def init_ui(self):
        # Logo
        if os.path.exists('logo.png'):
            logo = Image(source='logo.png', size_hint=(1, 0.2))
            self.add_widget(logo)
        
        # Form alanları
        form_layout = GridLayout(cols=2, spacing=10, size_hint_y=None)
        form_layout.bind(minimum_height=form_layout.setter('height'))
        
        # Örnek form alanları
        form_items = ["Dosya No", "Müvekkil", "İcra Dairesi", "Dosya Tarihi"]
        
        for item in form_items:
            form_layout.add_widget(Label(text=item))
            form_layout.add_widget(TextInput(multiline=False))
        
        # Kaydet butonu
        save_btn = Button(text='KAYDET', size_hint_y=None, height=50)
        save_btn.bind(on_press=self.kaydet)
        
        self.add_widget(form_layout)
        self.add_widget(save_btn)
    
    def kaydet(self, instance):
        print("Kayıt işlemi başlatıldı")

class HukukTakipApp(App):
    def build(self):
        self.title = 'Hukuk Takip Sistemi'
        
        # Ana düzen
        main_layout = BoxLayout(orientation='vertical')
        
        # Sekmeli panel
        tabs = TabbedPanel()
        
        # İcra Takip Sekmesi
        icra_tab = TabbedPanelItem(text='İcra Takip')
        icra_tab.add_widget(IcraTakipTab())
        tabs.add_widget(icra_tab)
        
        main_layout.add_widget(tabs)
        return main_layout

if __name__ == '__main__':
    HukukTakipApp().run()