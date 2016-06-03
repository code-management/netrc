require 'spec_helper'


describe 'netrc::machine' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts.merge({ 
            :concat_basedir => '/tmp', 
          })
        end
        
        
        context "netrc::machine with machine passed as title, path, login and password" do
          let(:title) do 
            'my_machine' 
          end

          let(:params) do
            {
              :path     => '/home/myuser/.netrc',
              :login    => 'myuser',
              :password => 'hunter2'
            }
          end

          it do
            should compile
          end
          
          it do 
            should contain_concat__fragment('netrc_fragment_my_machine').with({
              'target' => '/home/myuser/.netrc' 
            })
          end
        end
      end
    end
  end
end
