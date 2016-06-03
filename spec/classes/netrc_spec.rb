require 'spec_helper'


describe 'netrc' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts.merge({ 
            :concat_basedir => '/tmp', 
          })
        end
        
        
        context "netrc with path and user" do
          let(:params) do
            {
              :path => '/home/myuser/.netrc',
              :user => 'myuser'
            }
          end

          it do
            is_expected.to compile
          end

          it do
            is_expected.to contain_concat('/home/myuser/.netrc').with({
              'ensure'         => 'present',
              'owner'          => 'myuser',
              'group'          => 'myuser',
              'mode'           => '0600',
              'warn'           => 'true',
              'ensure_newline' => 'true',
            })
          end
        end

        context "netrc with path, user and group" do
          let(:params) do
            {
              :path   => '/home/myuser/.netrc',
              :user   => 'myuser',
              :group => 'some_group'
            }
          end

          it do
            is_expected.to compile
          end

          it do
            is_expected.to contain_concat('/home/myuser/.netrc').with({
              'ensure'         => 'present',
              'owner'          => 'myuser',
              'group'          => 'some_group',
              'mode'           => '0600',
              'warn'           => 'true',
              'ensure_newline' => 'true',
            })
          end
        end
      end
    end
  end
end
